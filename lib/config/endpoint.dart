abstract class Endpoint {
  static _User user = _User();
  static _Record record = _Record();
}

class _User {
  final String _prefix = '/user';

  String get login => '$_prefix/login/';
  String get register => '$_prefix/register/';
}

class _Record {
  final String _prefix = '/record';

  String get create => '$_prefix/';
  String get list => '$_prefix/';
  String detail(int recordId) => '$_prefix/$recordId/';
}
