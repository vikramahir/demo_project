import 'package:get/get.dart';

class DetailsController extends GetxController {
  RxInt finalCount = 0.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    if(Get.arguments != null) {
      finalCount.value = Get.arguments['count'] ?? 121;
    }
    super.onInit();
  }
}