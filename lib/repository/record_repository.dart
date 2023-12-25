import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ormi2_4/config/endpoint.dart';
import 'package:ormi2_4/models/enums.dart';
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

  Future<BaseResponse<Record>> createRecord() async {
    try {
      final res = await dio.post(Endpoint.record.create, data: {"kind": Kind.run});
      final responseModel = Record.fromJson(res.data);
      return BaseResponse.data(responseModel);
    } on DioException catch (e) {
      return BaseResponse.error(AppError(error: e.error ?? ''));
    }
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

  Future<BaseResponse<Record>> updateRecord(int recordId, Kind kind) async {
    try {
      final res = await dio.patch(Endpoint.record.detail(recordId), data: {"kind": kind});
      final responseModel = Record.fromJson(res.data);
      return BaseResponse.data(responseModel);
    } on DioException catch (e) {
      return BaseResponse.error(AppError(error: e.error ?? ''));
    }
  }

  Future<BaseResponse<Record>> endRecord(int recordId, List<LatLng> coords) async {
    try {
      final res = await dio.patch(Endpoint.record.endRecord(recordId), data: {"coords": "$coords"});
      final responseModel = Record.fromJson(res.data);
      return BaseResponse.data(responseModel);
    } on DioException catch (e) {
      return BaseResponse.error(AppError(error: e.error ?? ''));
    }
  }
}
