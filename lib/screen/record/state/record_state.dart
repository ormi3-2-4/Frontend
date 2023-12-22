import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ormi2_4/models/enums.dart';

enum RunningState { running, paused, stopped }

class RecordController extends GetxController {
  static RecordController get instance => Get.find();

  Rx<LatLng> currentLocation = const LatLng(0, 0).obs;
  final Stream _positionStream = Geolocator.getPositionStream();
  RxList<Polyline> polylines = <Polyline>[].obs;
  Rx<RunningState> runningState = RunningState.running.obs;
  Rx<Kind> kind = Kind.run.obs;

  void changeRunningState(RunningState state) {
    runningState.value = state;
  }

  void changeKind(Kind kind) {
    this.kind.value = kind;
  }

  @override
  Future<void> onInit() async {
    print("RecordController init");
    currentLocation = await Geolocator.getCurrentPosition()
        .then((value) => LatLng(value.latitude, value.longitude).obs);
    _positionStream.listen((position) {
      currentLocation = LatLng(position.latitude, position.longitude).obs;
    });
    super.onInit();
  }
}
