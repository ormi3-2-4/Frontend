import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:ormi2_4/models/enums.dart';

enum RunningState { running, paused, stopped }

class RecordController extends GetxController {
  static RecordController get instance => Get.find();
  // RxList<Polyline> polylines = <Polyline>[].obs;
  RxList<LatLng> coords = <LatLng>[].obs;
  Rx<RunningState> runningState = RunningState.running.obs;
  Rx<Kind> kind = Kind.run.obs;
  Rx<Stream<Position>> currentPositionStream = Geolocator.getPositionStream().obs;
  Rx<LatLng> currentLocation = const LatLng(0, 0).obs;

  void listenCurrentPosition() {
    currentPositionStream.value.listen(
      (position) {
        if (runningState.value == RunningState.running) {
          currentLocation.value = LatLng(position.latitude, position.longitude);
          coords.add(LatLng(position.latitude, position.longitude));
          Logger().i(LatLng(position.latitude, position.longitude));
        }
      },
    );
  }

  void changeRunningState(RunningState state) {
    runningState.value = state;
  }

  void changeKind(Kind kind) {
    this.kind.value = kind;
  }

  void onPressedEnd() {
    Logger().d(coords);
  }

  @override
  void onInit() {
    listenCurrentPosition();
    super.onInit();
  }
}
