import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../DataRespon/Respon_login.dart';
import '../../../data/LocalData.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  //login
  void login(email, Password) async {
    isLoading.value = true;
    var headers = {
      'Accept': 'application/json',
    };
    var requires = {
      "email": email,
      "password": Password,
    };
    var response = await http.post(
        Uri.parse('http://192.168.200.235:8000/api/login'),
        headers: headers,
        body: requires);
    var res = jsonDecode(response.body);
    print(res['status']);

    //setatus code 200
    if (res['status'] == "success") {
      isLoading.value = false;
      await LocalData().savedata(ResponDataLogin.fromMap(res));
      Get.toNamed(Routes.HOME);
    } else if (res['status'] == "failed") {
      isLoading.value = false;
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        message: res['message'],
      ));
    } else {
      isLoading.value = false;
      Get.toNamed(Routes.DAFTAR);
    }
  }
}
