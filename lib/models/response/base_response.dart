import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ormi2_4/models/response/error.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class BaseResponse<T> with _$BaseResponse {
  const BaseResponse._();
  const factory BaseResponse({
    @Default(null) T? data,
    @Default(null) AppError? error,
  }) = _BaseResponse;

  const factory BaseResponse.data(T data) = BaseResponseData;
  const factory BaseResponse.error(AppError error) = BaseResponseError;

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}
