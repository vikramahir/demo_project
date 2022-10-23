import 'package:demo_project/model/movie_data.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  RxInt finalCount = 0.obs;
  Rx<Entries> entries = Entries().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    if (Get.arguments != null) {
      entries.value = Get.arguments['entries'];
      finalCount.value = Get.arguments['count'] ?? 121;
    }
    super.onInit();
  }
}
