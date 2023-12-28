import 'package:dio/dio.dart';
import 'package:ormi2_4/config/endpoint.dart';
import 'package:ormi2_4/models/response/base_response.dart';
import 'package:ormi2_4/models/response/course_response.dart';
import 'package:ormi2_4/models/response/error.dart';

class CourseRepository {
  const CourseRepository(this.dio);

  final Dio dio;

  Future<BaseResponse<CoursePreviewResponse>> getCourseList() async {
    try {
      final res = await dio.get(Endpoint.course.list);
      final responseModel = CoursePreviewResponse.fromJson(res.data);

      return BaseResponse.data(responseModel);
    } on DioException catch (e) {
      return BaseResponse.error(AppError(error: e.error ?? ''));
    }
  }

  Future<BaseResponse<CourseDeatilResponse>> getCourseDetail(int courseId) async {
    try {
      final res = await dio.get(Endpoint.course.detail(courseId));
      final responseModel = CourseDeatilResponse.fromJson(res.data);
      return BaseResponse.data(responseModel);
    } on DioException catch (e) {
      return BaseResponse.error(AppError(error: e.error ?? ''));
    }
  }
}
