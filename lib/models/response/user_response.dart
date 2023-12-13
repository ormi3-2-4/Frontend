import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ormi2_4/models/user_model.dart';

import '../Token.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserLoginResponse with _$UserLoginResponse {
  const UserLoginResponse._();
  const factory UserLoginResponse({
    required User user,
    required Token token,
  }) = _UserLoginResponse;

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseFromJson(json);
}
