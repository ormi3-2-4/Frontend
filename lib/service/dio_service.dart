import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ormi2_4/service/storage_service.dart';

class DioService extends GetxService {
  static DioService get instance => Get.find();

  final _dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:8000',
  ));

  Dio get dio => _dio;

  Future<void> addJwt() async {
    final accessToken = await StorageService.instance.storage.read(key: "access_token");
    _dio.options.headers.addAll({"Authorization": "Bearer $accessToken"});
  }
}
