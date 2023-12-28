import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ormi2_4/screen/record/state/record_state.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RecordController.instance;
    return Obx(() => Text(
          controller.time.value,
          style: context.textTheme.displayLarge,
          textAlign: TextAlign.center,
        ));
  }
}
