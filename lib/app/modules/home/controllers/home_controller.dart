import 'dart:convert';

import 'package:food_delivery/app/modules/home/models/restoproduk.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../DataRespon/Respon_login.dart';
import '../../../data/LocalData.dart';
import '../../../help/Api.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  var DataUser = ResponDataLogin().obs;
  var produk = [].obs;
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

  Future<List<dynamic>?> getallrestaurant() async {
    var uri = Uri.parse('$urlApi/api/restaurants');
    var response = await http.get(uri, headers: {
      "Authorization": "Bearer ${DataUser.value.data?.token}",
    });
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print("get all restaurant");
      var data = res['data'] as List<dynamic>;
      print(data);

      return data;
    }
  }

  Future<List?> getprodukrestoran(id) async {
    var uri = Uri.parse('$urlApi/api/restaurant/$id/products');
    var response = await http.get(uri, headers: {
      // "Authorization": "Bearer ${DataUser.value.data?.token}",
    });

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);

      // Parsing JSON menjadi list ProductModel
      List produkList = (res['data'] as List)
          .map((item) => Restoproduk.fromJson(item))
          .toList();

      // Cetak hasil untuk debug
      print("get all restaurant products");
      print(produkList);

      // Simpan produk ke dalam variabel produk (misalnya menggunakan GetX atau State Management lain)
      produk.value = produkList;

      return produkList;
    } else {
      // Handle error
      print("Failed to load products: ${response.statusCode}");
      return null;
    }
  }

  // @override
  // void onInit() {
  //   getData();
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
