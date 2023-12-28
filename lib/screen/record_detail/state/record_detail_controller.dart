import 'package:get/get.dart';
import 'package:ormi2_4/models/response/base_response.dart';
import 'package:ormi2_4/repository/record_repository.dart';
import 'package:ormi2_4/service/dio_service.dart';

import '../../../models/record_model.dart';

class RecordDetailController extends GetxController {
  static RecordDetailController instance(int recordId) => Get.find(tag: recordId.toString());

  Rx<Record?> record = (null).obs;
  RxBool isError = false.obs;

  Future<void> getRecord(int recordId) async {
    await DioService.instance.addJwt();
    final res = await RecordRepository(DioService.instance.dio).getRecord(recordId);

    switch (res) {
      case BaseResponseData():
        record = res.data.obs;
        isError = false.obs;
        break;

      case BaseResponseError():
        isError = true.obs;
        break;

      default:
        break;
    }
  }
}
