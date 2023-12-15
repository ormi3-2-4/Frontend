import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/common/buildcontext_utils.dart';
import 'package:ormi2_4/screen/record/record_screen.dart';
import 'package:ormi2_4/screen/record/state/record_state.dart';

class StartRunningCardWidget extends StatelessWidget {
  const StartRunningCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: context.screenWidth * 0.9,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: const Color(0xff424242)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "오늘도 힘차게 달려볼까요?",
                    style: context.textTheme.headlineMedium,
                  ),
                  SizedBox(height: 10.h),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .push(RecordScreen.routePath)
                            .then((value) => RecordController.instance.dispose());
                      },
                      child: const Text('운동 시작'))
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: const Placeholder(),
            ),
          )
        ],
      ),
    );
  }
}
