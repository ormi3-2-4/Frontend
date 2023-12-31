import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormi2_4/screen/course/state/course_state.dart';
import 'package:ormi2_4/screen/course/widgets/course_preview_card_wdiget.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  static const routePath = '/course';
  static const routeName = 'CourseScreen';

  @override
  Widget build(BuildContext context) {
    Get.put(CourseController());
    final controller = CourseController.instance;

    return Scaffold(
      appBar: AppBar(title: const Text("Course Screen")),
      body: FutureBuilder<void>(
        future: controller.getCourseList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Obx(() => ListView.builder(
                itemCount: controller.courseList.length,
                itemBuilder: (context, index) => CoursePreviewCard(controller.courseList[index]),
              ));
        },
      ),
    );
  }
}
