import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../DataRespon/Respon_login.dart';
import '../../../data/LocalData.dart';
import '../../../help/Api.dart';
import '../../../routes/app_pages.dart';

class RestoController extends GetxController {
  var DataUser = ResponDataLogin().obs;
  var token = "".obs;

  Future<Rx<ResponDataLogin>> getData() async {
    var data = await LocalData().getAuthData();
    print("data?.data?.token");
    print(data?.data?.token);
    // print(DataUser?.data?.user?.name);
    DataUser.value = data!;
    return DataUser;
  }

  void logout() async {
    print(DataUser.value.data!.token!);
    var prameter = {
      "Accept": "application/json",
      "Authorization": "Bearer ${DataUser.value.data!.token!}",
    };

    var response = await http.post(
      Uri.parse('$urlApi/api/logout'),
      headers: prameter,
    );

    if (response.statusCode == 200) {
      await LocalData().removeAuthData();
      Get.offAllNamed(Routes.LOGIN);
      print(response.body);
    } else {
      print(response.body);
    }
  }

  //register reto
  Future<void> registerResto(
    String name,
    String email,
    String phone,
    String password,
    File image,
  ) async {
    var uri = Uri.parse(
        '$urlApi/api/restaurant/register'); // Pastikan URL diawali dengan 'http://'
    var request = http.MultipartRequest('POST', uri);

    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['phone'] = phone;
    request.fields['password'] = password;
    request.fields['restaurant_name'] = name;
    request.fields['restaurant_address'] = name;
    request.fields['latlong'] = "14234,324434";

    request.files.add(await http.MultipartFile.fromPath('photo', image.path));

    var response = await request.send();

    print(image.path);

    if (response.statusCode == 200) {
      var res = jsonDecode(await response.stream.bytesToString());
      if (res['status'] == "success") {
        // Get.toNamed(Routes.LOGIN);
        print('Registration successful: ${res['message']}');
      } else {
        print('Registration failed: ${res['message']}');
      }
    } else {
      print('Server error: ${response.statusCode}');
    }
  }

//addproduk
  Future<void> addproduk(
    String name,
    String description,
    String price,
    String stock,
    bool is_available,
    bool is_favorite,
    XFile image,
  ) async {
    var user = await LocalData().getAuthData();
    var token = user?.data?.token;
    var uri = Uri.parse(
        '$urlApi/api/products'); // Pastikan URL diawali dengan 'http://'
    var request = http.MultipartRequest('POST', uri);

    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['price'] = price;
    request.fields['stock'] = stock;
    request.fields['is_available'] = is_available ? '1' : '0';
    request.fields['is_favorite'] = is_favorite ? '1' : '0';

    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    request.headers['Authorization'] = 'Bearer $token';
    var response = await request.send();

    if (response.statusCode == 200) {
      var res = jsonDecode(await response.stream.bytesToString());
      if (res['status'] == "success") {
        Get.back();
        print('Registration successful: ${res['message']}');
      } else {
        print('Registration failed: ${res['message']}');
      }
    } else {
      print('Server error: ${response.statusCode}');
    }
  }

//getproduk
  var products = [].obs;
  Future<List> getproduk() async {
    var user = await LocalData().getAuthData();
    var token = user?.data?.token;

    var response = await http.get(Uri.parse('$urlApi/api/products'),
        headers: {"Authorization": "Bearer $token"});
    var res = jsonDecode(response.body);
    print("ini data");
    print(res['data']);

    var data = res['data'] as List<dynamic>;
    print(data);
    products.value = data;

    return products;
  }

  //delete produk
  Future<void> deleteProduk(int id) async {
    var user = await LocalData().getAuthData();
    var token = user?.data?.token;
    var uri = Uri.parse('$urlApi/api/products/$id');
    var response = await http.delete(uri, headers: {
      "Authorization": "Bearer $token",
    });
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print(res);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getproduk();
  }
}
