import 'package:get/get.dart';
import 'package:ormi2_4/models/Token.dart';
import 'package:ormi2_4/models/response/base_response.dart';
import 'package:ormi2_4/models/response/user_response.dart';
import 'package:ormi2_4/repository/account_repository.dart';
import 'package:ormi2_4/service/dio_service.dart';
import 'package:ormi2_4/service/storage_service.dart';

import '../models/request/user_requests.dart';
import '../models/user_model.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find();
  RxBool isLoading = false.obs;

  Rx<User?> user = (null).obs;

  bool get isLogin => user.value != null;

  Future<void> autoLogin() async {
    isLoading.value = true;
    final refreshToken = await StorageService.instance.storage.read(key: "refresh_token");

    if (refreshToken == null) {
      isLoading.value = false;
      return;
    }

    // 자동 로그인 로직
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final request = UserLoginRequest(email: email, password: password);

    // 로그인 요청
    final res = await AccountRepository(DioService.instance.dio).login(request);
    switch (res) {
      case BaseResponseData():
        final response = res.data as UserLoginResponse;
        user = response.user.obs;
        await writeToken(response.token);
        break;
      case BaseResponseError():
        user.value = null;
        break;
    }

    isLoading.value = false;
  }

  Future<void> register(String email, String nickname, String password) async {
    isLoading.value = true;
    final request = UserRegisterRequest(email: email, nickname: nickname, password: password);

    // 회원가입 요청
    final res = await AccountRepository(DioService.instance.dio).register(request);
    switch (res) {
      case BaseResponseData():
        final response = res.data as UserLoginResponse;
        user = response.user.obs;
        await writeToken(response.token);
        break;
      case BaseResponseError():
        user.value = null;
        break;
    }
    isLoading.value = false;
  }

  Future<void> uploadProfileImage() async {}

  Future<void> logout() async {
    user.value = null;
  }

  Future<void> writeToken(Token token) async {
    await StorageService.instance.storage.write(key: "access_token", value: token.accessToken);
    await StorageService.instance.storage.write(key: "refresh_token", value: token.refreshToken);
  }

  @override
  Future<void> onInit() async {
    await autoLogin();
    super.onInit();
  }
}
