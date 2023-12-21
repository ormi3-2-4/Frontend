import 'package:freezed_annotation/freezed_annotation.dart';

import '../record_model.dart';

part 'record_response.freezed.dart';
part 'record_response.g.dart';

@freezed
class RecordHistoryResponse with _$RecordHistoryResponse {
  const RecordHistoryResponse._();
  const factory RecordHistoryResponse({
    required int count,
    @Default(null) int? next,
    @Default(null) int? pervious,
    required List<Record> results,
  }) = _RecordHistoryResponse;

  factory RecordHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$RecordHistoryResponseFromJson(json);
}


