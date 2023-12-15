import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecordController extends GetxController {
  static RecordController get instance => Get.find();

  Rx<LatLng> currentLocation = const LatLng(0, 0).obs;

  @override
  Future<void> onInit() async {
    Geolocator.getPositionStream().listen((position) {
      currentLocation = LatLng(position.latitude, position.longitude).obs;
    });
    super.onInit();
  }
}
