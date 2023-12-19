import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ormi2_4/screen/record/state/record_state.dart';

class RecordScreen extends HookWidget {
  const RecordScreen({Key? key}) : super(key: key);

  static const routePath = '/record';
  static const routeName = 'RecordScreen';

  @override
  Widget build(BuildContext context) {
    final controller = RecordController.instance;

    print(controller.currentLocation.value);

    return Scaffold(
      body: SafeArea(
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

              //
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("일시 정지"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("종료"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
