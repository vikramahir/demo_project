import 'package:demo_project/model/movie_data.dart';
import 'package:demo_project/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  RxInt finalCount = 0.obs;
  Rx<Entries> entries = Entries().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    verifyOTPCode();
    if (Get.arguments != null) {
      entries.value = Get.arguments['entries'];
      finalCount.value = Get.arguments['count'] ?? 121;
    }
    super.onInit();
  }
}

Future<void> verifyOTPCode() async {
  try {
    if (Get.arguments != null) {
      String number = Get.arguments['mobileNumber'];
      var otp = Get.arguments['otp'] ?? 0;
      var verificationId = Get.arguments['verificationId'] ?? '';
      print('----------==========> $otp');
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp.toString(),
      );
      await auth.signInWithCredential(credential).then(
          (value) => {
                Constant().customSnackbar(title: 'Alert', des: 'Success'),
              },
          onError: (error) => {
                Constant()
                    .customSnackbar(title: 'Alert', des: error.toString()),
              });
    }
  } catch (e) {
    print(e);
  }
}

class User {
  User();

  late final String name;

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}
