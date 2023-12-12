import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_requests.freezed.dart';
part 'user_requests.g.dart';

@Freezed(fromJson: false, toJson: true)
class UserLoginRequest with _$UserLoginRequest {
  const UserLoginRequest._();
  const factory UserLoginRequest({
    required String email,
    required String password,
  }) = _UserLoginRequest;
}
