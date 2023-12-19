import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecordController extends GetxController {
  static RecordController get instance => Get.find();

  Rx<LatLng> currentLocation = const LatLng(0, 0).obs;
  final Stream _positionStream = Geolocator.getPositionStream();
  RxList<Polyline> polylines = <Polyline>[].obs;

  @override
  Future<void> onInit() async {
    _positionStream.listen((position) {
      currentLocation = LatLng(position.latitude, position.longitude).obs;
    });
    super.onInit();
  }
}
