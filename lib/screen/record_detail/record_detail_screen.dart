import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormi2_4/screen/record_detail/state/record_detail_controller.dart';

class RecordDetailScreen extends StatelessWidget {
  const RecordDetailScreen(this.recordId, {super.key});

  final int recordId;

  static String routeWithId(int recordId) => '/record_history/$recordId';
  static const routePath = ':recordId';
  static const routeName = 'RecordDetailScreen';

  @override
  Widget build(BuildContext context) {
    Get.put(RecordDetailController(), tag: recordId.toString());
    final controller = RecordDetailController.instance(recordId);

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: controller.getRecord(recordId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Obx(() => Text(controller.record.toString()));
          }
        },
      ),
    );
  }
}
