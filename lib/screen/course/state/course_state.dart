import 'package:get/get.dart';
import 'package:ormi2_4/models/response/base_response.dart';
import 'package:ormi2_4/repository/course_repository.dart';
import 'package:ormi2_4/service/dio_service.dart';

import '../../../models/course_model.dart';

class CourseController extends GetxController {
  static CourseController instance = Get.find();

  RxList<CoursePreview> courseList = <CoursePreview>[].obs;
  RxBool isError = false.obs;
  Rx<CourseDetail?> courseDetail = (null).obs;

  Future<void> getCourseList() async {
    await DioService.instance.addJwt();
    final res = await CourseRepository(DioService.instance.dio).getCourseList();

    switch (res) {
      case BaseResponseData():
        courseList = res.data.data.obs;
        isError = false.obs;
        break;
      case BaseResponseError():
        isError = true.obs;
      default:
        break;
    }
  }

  Future<void> getCourseDetail(int courseId) async {
    await DioService.instance.addJwt();
    final res = await CourseRepository(DioService.instance.dio).getCourseDetail(courseId);

    switch (res) {
      case BaseResponseData():
        courseDetail = res.data.data.obs;
        isError = false.obs;
        break;
      case BaseResponseError():
        isError = true.obs;
      default:
        break;
    }
  }
}
