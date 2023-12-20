import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ormi2_4/models/course_model.dart';

part 'course_response.freezed.dart';
part 'course_response.g.dart';

@freezed
class CoursePreviewResponse with _$CoursePreviewResponse {
  const CoursePreviewResponse._();
  const factory CoursePreviewResponse({
    required List<CoursePreview> data,
  }) = _CoursePreviewResponse;

  factory CoursePreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$CoursePreviewResponseFromJson(json);
}

@freezed
class CourseDeatilResponse with _$CourseDeatilResponse {
  const CourseDeatilResponse._();
  const factory CourseDeatilResponse({
    required CourseDetail data,
  }) = _CourseDeatilResponse;

  factory CourseDeatilResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseDeatilResponseFromJson(json);
}
