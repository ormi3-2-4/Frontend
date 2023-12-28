abstract class Endpoint {
  static _User user = _User();
  static _Record record = _Record();
  static _Course course = _Course();
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
  String endRecord(int recordId) => '$_prefix/$recordId/finish/';
}

class _Course {
  final String _prefix = "/course";

  String get list => '$_prefix/';
  String get create => '$_prefix/';
  String detail(int courseId) => '$_prefix/$courseId/';
}
