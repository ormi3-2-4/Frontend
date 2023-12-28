import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ormi2_4/models/user_model.dart';

import '../models/record_model.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
class CoursePreview with _$CoursePreview {
  const CoursePreview._();
  const factory CoursePreview(
      {required int id,
      required String title,
      required String content,
      required int user,
      required DateTime createdAt,
      required int viewCount,
      required List<int> likes,
      required String tags}) = _CoursePreview;

  factory CoursePreview.fromJson(Map<String, dynamic> json) => _$CoursePreviewFromJson(json);
}

@freezed
class CourseDetail with _$CourseDetail {
  const CourseDetail._();
  const factory CourseDetail({
    required int id,
    required String title,
    required String content,
    required User user,
    required Record record,
    required DateTime createdAt,
    required int viewCount,
    required List<int> likes,
    required String tags,
  }) = _CourseDetail;

  factory CourseDetail.fromJson(Map<String, dynamic> json) => _$CourseDetailFromJson(json);
}
