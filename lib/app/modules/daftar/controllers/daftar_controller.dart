import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';

class DaftarController extends GetxController {
//register
  void register(name, email, phone, password) async {
    var request = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    };

    var response = await http.post(
        Uri.parse('http://192.168.200.205:8000/api/user/register'),
        body: request);
    var res = jsonDecode(response.body);
    if (res['status'] != "error") {
      Get.toNamed(Routes.LOGIN);
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        message: res['message'],
      ));
    }
    print(res['status']);
  }
}
