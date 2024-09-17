import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../DataRespon/Respon_login.dart';
import '../../../data/LocalData.dart';
import '../../../help/Api.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  //login
  void login(email, Password) async {
    if (email != "" && Password != "" || email != null && Password != null) {
      isLoading.value = true;
      var headers = {
        'Accept': 'application/json',
      };
      var requires = {
        "email": email,
        "password": Password,
      };
      var response = await http.post(Uri.parse('$urlApi/api/login'),
          headers: headers, body: requires);
      var res = jsonDecode(response.body);

      //setatus code 200
      if (res['status'] == "success") {
        isLoading.value = false;

        if (res['data']['user']['roles'] == 'user') {
          await LocalData().savedata(ResponDataLogin.fromMap(res));
          print("home user");
          Get.offNamed(Routes.HOME);
        } else {
          await LocalData().savedata(ResponDataLogin.fromMap(res));
          print("home resto");
          Get.offNamed(Routes.RESTO);
        }
      } else if (res['status'] == "failed") {
        isLoading.value = false;
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 2),
          message: res['message'],
        ));
      } else {
        isLoading.value = false;
        Get.offNamed(Routes.DAFTAR);
      }
    }
    isLoading.value = false;
    Get.showSnackbar(GetSnackBar(
      duration: Duration(seconds: 2),
      message: "email dan password tidak boleh kosong",
    ));
  }
}
