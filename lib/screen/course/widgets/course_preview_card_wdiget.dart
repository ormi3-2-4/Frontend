import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/models/course_model.dart';

class CoursePreviewCard extends StatelessWidget {
  const CoursePreviewCard(this.course, {super.key});

  final CoursePreview course;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          context.push('/course/${course.id}');
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(course.title, style: context.textTheme.headlineMedium),
              SizedBox(height: 10.h),
              Text(course.content, style: context.textTheme.bodyMedium),
              // Text(course.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
