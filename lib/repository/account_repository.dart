import 'package:ormi2_4/models/request/user_requests.dart';
import 'package:ormi2_4/models/response/base_response.dart';

class AccountRepository {
  // make this class a singleton class
  AccountRepository._();
  static final AccountRepository instance = AccountRepository._();

  Future<BaseResponse> login(UserLoginRequest request) async {
    return const BaseResponse.data(true);
  }

  Future<BaseResponse> signup(String email, String password, String nickname) async {
    return const BaseResponse.data(true);
  }

  Future<BaseResponse> refreshToken() async {
    return const BaseResponse.data(true);
  }
}
