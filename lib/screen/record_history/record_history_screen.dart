import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormi2_4/screen/record_history/state/record_history_state.dart';

import '../../models/record_model.dart';

class RecrodHistoryScreen extends StatelessWidget {
  const RecrodHistoryScreen({super.key});

  static const routhPath = '/record_history';
  static const routeName = 'Recrod History';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecordHistoryController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Record History"),
      ),
      body: Column(
        children: [
          // 검색 및 필터
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: TextField()),
              Icon(Icons.search),
              Icon(Icons.filter_alt_rounded)
            ],
          ),

          // 데이터
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: controller.records.length,
              itemBuilder: (context, index) => HistoryCard(controller.records[index]),
            ),
          )),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard(this.record, {super.key});

  final Record record;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
