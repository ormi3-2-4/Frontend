import 'package:dio/dio.dart';
import 'package:ormi2_4/config/endpoint.dart';
import 'package:ormi2_4/models/response/base_response.dart';
import 'package:ormi2_4/models/response/error.dart';
import 'package:ormi2_4/models/response/record_response.dart';

import '../models/record_model.dart';

class RecordRepository {
  const RecordRepository(this.dio);

  final Dio dio;

  Future<BaseResponse<RecordHistoryResponse>> getRecordList() async {
    try {
      final res = await dio.get(Endpoint.record.list);
      final responseModel = RecordHistoryResponse.fromJson(res.data);
      return BaseResponse.data(responseModel);
    } on DioException catch (e) {
      return BaseResponse.error(AppError(error: e.error ?? ''));
    }
  }

  Future<BaseResponse> createRecord() async {
    // TODO: Reqeust 모델 생성, 로직 구현
    return const BaseResponse.data(true);
  }

  Future<BaseResponse<Record>> getRecord(int recordId) async {
    try {
      final res = await dio.get(Endpoint.record.detail(recordId));
      final responseModel = Record.fromJson(res.data);
      return BaseResponse.data(responseModel);
    } on DioException catch (e) {
      return BaseResponse.error(AppError(error: e.error ?? ''));
    }
  }
}
