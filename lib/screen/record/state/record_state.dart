import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:ormi2_4/models/enums.dart';
import 'package:ormi2_4/models/response/base_response.dart';
import 'package:ormi2_4/repository/record_repository.dart';
import 'package:ormi2_4/service/dio_service.dart';

import '../../../models/record_model.dart';

enum RunningState { running, paused, stopped }

class RecordController extends GetxController {
  static RecordController get instance => Get.find();
  // RxList<Polyline> polylines = <Polyline>[].obs;
  RxList<LatLng> coords = <LatLng>[].obs;
  Rx<Polyline> polyline = const Polyline(polylineId: PolylineId('1'), points: []).obs;

  Rx<RunningState> runningState = RunningState.running.obs;
  Rx<Kind> kind = Kind.run.obs;
  Rx<Stream<Position>> currentPositionStream = Geolocator.getPositionStream().obs;
  Rx<LatLng> currentLocation = const LatLng(0, 0).obs;
  RxDouble speed = 0.0.obs;
  Rx<DateTime> startAt = DateTime.now().obs;
  Duration _time = Duration.zero;
  RxString time = '00:00'.obs;
  Timer? timer;
  Record? _record;

  Future<void> createRecord() async {
    await DioService.instance.addJwt();
    final res = await RecordRepository(DioService.instance.dio).createRecord();

    switch (res) {
      case BaseResponseData():
        _record = res.data;
        break;
      case BaseResponseError():
        break;

      default:
        break;
    }

    Logger().d(_record);
  }

  Future<void> updateRecord() async {
    await DioService.instance.addJwt();
    final res =
        await RecordRepository(DioService.instance.dio).updateRecord(_record!.id, kind.value);
    switch (res) {
      case BaseResponseData():
        _record = res.data;
        break;
      case BaseResponseError():
        break;

      default:
        break;
    }
  }

  Future<void> endRecord() async {
    await DioService.instance.addJwt();
    final res = await RecordRepository(DioService.instance.dio).endRecord(_record!.id, coords);
    switch (res) {
      case BaseResponseData():
        _record = res.data;
        break;
      case BaseResponseError():
        break;

      default:
        break;
    }
  }

  void listenCurrentPosition() {
    currentPositionStream.value.listen(
      (position) {
        if (runningState.value == RunningState.running) {
          currentLocation.value = LatLng(position.latitude, position.longitude);
          coords.add(LatLng(position.latitude, position.longitude));
          Logger().i(LatLng(position.latitude, position.longitude));
          speed.value = position.speed;

          polyline.value = polyline.value.copyWith(pointsParam: coords);
        }
      },
    );
  }

  void changeRunningState(RunningState state) {
    runningState.value = state;

    if (state == RunningState.running) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        _time += const Duration(seconds: 1);
        time.value = "${_time.inMinutes}:${_time.inSeconds % 60}";
      });
    } else if (state == RunningState.paused) {
      timer?.cancel();
    }
  }

  Future<void> changeKind(Kind kind) async {
    this.kind.value = kind;
    await updateRecord();
  }

  Future<void> onPressedEnd() async {
    Logger().d(coords);
    timer?.cancel();
    await endRecord();
  }

  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _time += const Duration(seconds: 1);
      time.value = "${_time.inMinutes}: ${_time.inSeconds % 60}";
    });
    listenCurrentPosition();
    super.onInit();
  }
}
