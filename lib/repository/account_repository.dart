import 'package:dio/dio.dart';
import 'package:ormi2_4/config/endpoint.dart';
import 'package:ormi2_4/models/request/user_requests.dart';
import 'package:ormi2_4/models/response/base_response.dart';
import 'package:ormi2_4/models/response/user_response.dart';

import '../models/response/error.dart';

class AccountRepository {
  final Dio dio;

  const AccountRepository(this.dio);

  Future<BaseResponse> login(UserLoginRequest request) async {
    try {
      final res = await dio.post(Endpoint.user.login, data: request.toJson());
      final responseModel = BaseResponseData.fromJson(
          res.data, (json) => UserLoginResponse.fromJson(json as Map<String, dynamic>));
      return responseModel;
    } on DioException catch (e) {
      return BaseResponse.error(AppError(error: e.error ?? ''));
    }
  }

  Future<BaseResponse> register(UserRegisterRequest request) async {
    try {
      final res = await dio.post(Endpoint.user.register, data: request.toJson());
      final responseModel = BaseResponseData.fromJson(
          res.data, (json) => UserLoginResponse.fromJson(json as Map<String, dynamic>));
      return responseModel;
    } on DioException catch (e) {
      return BaseResponse.error(AppError(error: e.error!));
    }
  }

  Future<BaseResponse> refreshToken() async {
    return const BaseResponse.data(true);
  }
}
