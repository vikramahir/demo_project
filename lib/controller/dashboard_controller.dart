import 'package:demo_project/api/rest_client.dart';
import 'package:demo_project/model/movie_data.dart';
import 'package:demo_project/routes/name_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    // Get.toNamed(NameRoutes.detailsScreen,
    //     arguments: {'count': counter.value, 'entries': entries});
    _verifyUserPhoneNumber(entries);
  }

  void _verifyUserPhoneNumber(Entries entries) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String number = '+918238823001';
    try {
      auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          // closeProgressDialog();
          print(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          print(verificationId);
          Get.toNamed(NameRoutes.detailsScreen,
              arguments: {'count': counter.value, 'entries': entries,
                    'mobileNumber': number,
                     'otp': 123456,
                     'verificationId': verificationId,
                     });
          // Get.toNamed(
          //   NameRoutes.optScreen,
          //   arguments: {
          //     'mobileNumber': mapData['data']['mobile_no'],
          //     'otp': mapData['data']['otp'],
          //     'verificationId': verificationId,
          //   },
          // );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print(verificationId);
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
