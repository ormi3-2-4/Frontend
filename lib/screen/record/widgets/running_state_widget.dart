import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/screen/record/state/record_state.dart';

class RunningStateWidget extends StatelessWidget {
  const RunningStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contoller = RecordController.instance;

    return Obx(() {
      final runningState = contoller.runningState.value;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60.h,
            width: 150.w,
            child: ElevatedButton(
              onPressed: () {
                switch (runningState) {
                  case RunningState.running:
                    contoller.changeRunningState(RunningState.paused);
                    break;
                  case RunningState.paused:
                    contoller.changeRunningState(RunningState.running);
                    break;
                  default:
                    break;
                }
              },
              child: Text(switch (runningState) {
                RunningState.running => '일시 정지',
                RunningState.paused => '재개',
                RunningState.stopped => '일시 정지'
              }),
            ),
          ),
          SizedBox(width: 40.w),
          SizedBox(
            height: 60.h,
            width: 150.w,
            child: ElevatedButton(
              onPressed: () async {
                context.pop();
                Get.delete<RecordController>();
              },
              child: const Text("종료"),
            ),
          )
        ],
      );
    });
  }
}
