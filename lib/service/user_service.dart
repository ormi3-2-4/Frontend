import 'package:get/get.dart';

import '../models/user_model.dart';

class UserService extends GetxService {
  RxBool isLoading = false.obs;

  Rx<User?> user = null.obs;

  bool get isLogin => user.value != null;

  Future<void> autoLogin() async {
    print("autoLogin");
  }

  Future<void> login() async {}

  Future<void> register() async {}

  Future<void> logout() async {
    user.value = null;
  }

  @override
  Future<void> onInit() async {
    await autoLogin();
    super.onInit();
  }
}
