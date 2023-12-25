import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/models/enums.dart';
import 'package:ormi2_4/screen/record_detail/record_detail_screen.dart';
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

  Widget showIcon(Kind kind) {
    switch (kind) {
      case Kind.walk:
        return const Icon(Icons.directions_walk_rounded, color: Colors.white);
      case Kind.run:
        return const Icon(Icons.directions_run_rounded, color: Colors.white);
      case Kind.bike:
        return const Icon(Icons.pedal_bike_rounded, color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.push(RecordDetailScreen.routeWithId(record.id)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black, borderRadius: BorderRadius.circular(10.r)),
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Row(
                      children: [
                        showIcon(record.kind),
                        SizedBox(width: 5.w),
                        Text(record.kind.kName,
                            style: context.textTheme.bodyLarge?.copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Image.asset('assets/tabler_clock.png'),
                      SizedBox(width: 5.w),
                      Text(record.time, style: context.textTheme.bodyMedium),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/road.png'),
                      SizedBox(width: 5.w),
                      Text("${record.distance} km"),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/speed.png'),
                      SizedBox(width: 5.w),
                      Text("${record.speed} km/h"),
                    ],
                  ),
                ],
              ),
              const Spacer(),

              // 칼로리
              Column(
                children: [
                  Image.asset('assets/fire.png'),
                  Text("${record.calorie} kcal"),
                ],
              ),
              if (record.images.isNotEmpty) Image.network(record.images.first)
            ],
          ),
        ),
      ),
    );
  }
}
