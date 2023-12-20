import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormi2_4/screen/course/state/course_state.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  static const routePath = '/course';
  static const routeName = 'CourseScreen';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CourseController());

    return Scaffold(
      appBar: AppBar(title: const Text("Course Screen")),
    );
  }
}
