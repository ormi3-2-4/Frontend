import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxService {
  static StorageService get instance => Get.find();

  final _storage = const FlutterSecureStorage();
  FlutterSecureStorage get storage => _storage;
}
