abstract class Endpoint {
  static _User get user => _User();
}

class _User {
  final String prefix = '/user';

  String get login => '$prefix/login/';
  String get signup => '$prefix/register/';
}
