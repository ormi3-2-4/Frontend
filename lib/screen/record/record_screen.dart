import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  final controller = Get.put(RecordController());

  @override
  void dispose() {
    Get.delete<RecordController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
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

              // 일시 정지, 종료
              Positioned(
                bottom: 10.h,
                left: context.width * 0.2,
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
