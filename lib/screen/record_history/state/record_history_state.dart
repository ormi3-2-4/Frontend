import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ormi2_4/models/response/base_response.dart';
import 'package:ormi2_4/repository/record_repository.dart';
import 'package:ormi2_4/service/dio_service.dart';

import '../../../models/record_model.dart';

class RecordHistoryController extends GetxController {
  static RecordHistoryController get instance => Get.find();

  RxList<Record> records = <Record>[].obs;
  RxInt recordCount = 0.obs;
  RxBool isError = false.obs;

  Future<void> getRecordHistory() async {
    await DioService.instance.addJwt();
    final res = await RecordRepository(DioService.instance.dio).getRecordList();

    switch (res) {
      case BaseResponseData():
        final response = res.data;
        records.value = response.results;
        recordCount.value = response.count;
        isError.value = false;
        break;

      case BaseResponseError():
        isError.value = true;
      default:
        break;
    }
  }

  @override
  Future<void> onInit() async {
    await getRecordHistory();
    Logger().d(records.value);
    super.onInit();
  }
}
