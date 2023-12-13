import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';
part 'error.g.dart';

@freezed
class AppError with _$AppError {
  const AppError._();
  const factory AppError({required Object error, @Default("실패") String message}) = _AppError;

  factory AppError.fromJson(Map<String, dynamic> json) => _$AppErrorFromJson(json);
}
