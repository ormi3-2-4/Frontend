import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:ormi2_4/screen/record/state/record_state.dart';
import 'package:ormi2_4/screen/record/widgets/choice_widget.dart';
import 'package:ormi2_4/screen/record/widgets/running_state_widget.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  static const routePath = '/record';
  static const routeName = 'RecordScreen';

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  void initState() {
    super.initState();

    Geolocator.getPositionStream().listen((event) {
      RecordController.instance.currentLocation.value = LatLng(event.latitude, event.longitude);
      Logger().i('lat: ${event.latitude}, lng: ${event.longitude}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = RecordController.instance;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Obx(
          () => Stack(
            children: [
              // 지도
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: controller.currentLocation.value, zoom: 18),
                mapToolbarEnabled: true,
                compassEnabled: true,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                zoomControlsEnabled: true,
                onMapCreated: (mapController) {
                  mapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(target: controller.currentLocation.value, zoom: 18),
                    ),
                  );
                },
              ),

              // 일시 정지, 종료
              Positioned(
                bottom: 10.h,
                left: 0,
                right: 0,
                child: const RunningStateWidget(),
              ),

              // 운동 종류 변경
              Positioned(top: context.height * 0.3, right: 10.w, child: const KindWidget())
            ],
          ),
        ),
      ),
    );
  }
}
