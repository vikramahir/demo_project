import 'package:demo_project/model/movie_data.dart';
import 'package:demo_project/routes/name_routes.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DashboardController extends GetxController {
  RxInt counter = 0.obs;
  RxBool isLoading = false.obs;

  incrementCounter() => counter.value++;
  MovieData movieData = MovieData();

  @override
  void onInit() {
    // TODO: implement onInit
    getHttp();
    super.onInit();
  }

  void getHttp() async {
    try {
      isLoading.value = true;
      var response = await Dio().get('https://api.publicapis.org/entries');
      isLoading.value = false;
      movieData = MovieData.fromJson(response.data);
      print(response);
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  goToDetails(Entries entries) {
    Get.toNamed(NameRoutes.detailsScreen, arguments: {'count': counter.value,'entries' : entries});
  }
}
