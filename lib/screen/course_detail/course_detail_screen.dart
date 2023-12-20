import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormi2_4/screen/course/state/course_state.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen(this.courseId, {super.key});

  final int courseId;

  static String pathWithId(int courseId) => '/course/$courseId';
  static const routePath = ':courseId';
  static const routeName = 'CourseDetailScreen';

  @override
  Widget build(BuildContext context) {
    final controller = CourseController.instance;
    final course = controller.courseDetail.value;
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text(course?.title ?? ""))),
      body: Obx(
        () => FutureBuilder(
          future: controller.getCourseDetail(courseId),
          builder: (context, snapshot) {
            if (controller.isDetailError.isTrue) {
              return const Placeholder();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return const Placeholder();
          },
        ),
      ),
    );
  }
}
