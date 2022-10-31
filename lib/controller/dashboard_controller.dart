import 'package:demo_project/api/rest_client.dart';
import 'package:demo_project/model/movie_data.dart';
import 'package:demo_project/routes/name_routes.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt counter = 0.obs;
  RxBool isLoading = false.obs;

  incrementCounter() => counter.value++;
  MovieData movieData = MovieData();

  @override
  void onInit() {
    // TODO: implement onInit
    _getHttp();
    super.onInit();
  }

  final _restClient = RestClient();

  void _getHttp() async {
    try {
      isLoading.value = true;

      var response = await _restClient.get(path: 'entries');
      isLoading.value = false;
      movieData = MovieData.fromJson(response.data);
      print(response);
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  goToDetails(Entries entries) {
    Get.toNamed(NameRoutes.detailsScreen,
        arguments: {'count': counter.value, 'entries': entries});
  }
}
