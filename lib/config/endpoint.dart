abstract class Endpoint {
  static _User get user => _User();
}

class _User {
  final String _prefix = '/user';

  String get login => '$_prefix/login/';
  String get register => '$_prefix/register/';
}
