import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ormi2_4/models/enums.dart';
import 'package:ormi2_4/screen/record/state/record_state.dart';

class KindWidget extends StatelessWidget {
  const KindWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RecordController.instance;
    return Obx(() {
      final kind = controller.kind.value;
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5.r,
                blurRadius: 5.r,
                offset: const Offset(-5, 5)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => controller.changeKind(Kind.walk),
              child: ColoredBox(
                color: kind == Kind.walk ? Colors.grey : Colors.white,
                child: renderIcon(Icons.directions_walk_rounded, kind == Kind.walk),
              ),
            ),
            SizedBox(height: 10.w),
            InkWell(
              onTap: () => controller.changeKind(Kind.run),
              child: ColoredBox(
                color: kind == Kind.run ? Colors.grey : Colors.white,
                child: renderIcon(Icons.directions_run_rounded, kind == Kind.run),
              ),
            ),
            SizedBox(height: 10.w),
            InkWell(
              onTap: () => controller.changeKind(Kind.bike),
              child: ColoredBox(
                color: kind == Kind.bike ? Colors.grey : Colors.white,
                child: renderIcon(Icons.pedal_bike_rounded, kind == Kind.bike),
              ),
            ),
          ],
        ),
      );
    });
  }

  Icon renderIcon(IconData icon, bool selected) => Icon(
        icon,
        color: selected ? Colors.blue : Colors.grey,
        size: 50,
      );
}
