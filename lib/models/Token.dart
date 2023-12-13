import 'package:freezed_annotation/freezed_annotation.dart';

part 'Token.freezed.dart';
part 'Token.g.dart';

@freezed
class Token with _$Token {
  const Token._();
  const factory Token({
    required String accessToken,
    required String refreshToken,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
