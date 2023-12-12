import 'package:get/get.dart';

import '../models/user_model.dart';

class UserService extends GetxService {
  RxBool isLoading = false.obs;

  Rx<User?> user = null.obs;

  void login() {}

  void register() {}

  void logout() {
    user.value = null;
  }
}
