import 'package:get/get.dart';

import '../../../models/course_model.dart';

class CourseController extends GetxController {
  static CourseController instance = Get.find();

  RxList<CoursePreview> courseList = <CoursePreview>[].obs;
  Rx<CourseDetail?> courseDetail = (null).obs;

  Future<void> getCourseList() async {}
}
