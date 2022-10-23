import 'package:demo_project/routes/name_routes.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt counter = 0.obs;

  incrementCounter() => counter.value++;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  goToDetails() {
    Get.toNamed(NameRoutes.detailsScreen, arguments: {'count': counter.value});
  }
}
