import 'package:demo_project/controller/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings{

 @override
  void dependencies() {
    // TODO: implement dependencies
   Get.lazyPut<DashboardController>(() => DashboardController());
  }
}