import 'dart:convert';
import 'dart:io';

import 'package:food_delivery/app/modules/Resto/models/Order_resto.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../DataRespon/Respon_login.dart';
import '../../../data/LocalData.dart';
import '../../../help/Api.dart';
import '../../../routes/app_pages.dart';
import '../models/orderItemeresto.dart';

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
    // String latlong,
    File image,
  ) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print(
          'Location permissions are permanently denied, we cannot request permissions.');
      return;
    }

    // Mengambil lokasi pengguna
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String latlong = '${position.latitude},${position.longitude}';
    print("$name,$email,$phone,$password,$latlong");
    var uri = Uri.parse(
        '$urlApi/api/restaurant/register'); // Pastikan URL diawali dengan 'http://'
    var request = http.MultipartRequest('POST', uri);

    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['phone'] = phone;
    request.fields['password'] = password;
    request.fields['restaurant_name'] = name;
    request.fields['restaurant_address'] = name;
    request.fields['latlong'] = latlong;

    request.files.add(await http.MultipartFile.fromPath('photo', image.path));

    var response = await request.send();

    print(image.path);

    if (response.statusCode == 200) {
      var res = jsonDecode(await response.stream.bytesToString());
      if (res['status'] == "success") {
        Get.toNamed(Routes.LOGIN);
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
        print('Registration successful: ${res['message']}');
        // Get.toNamed(Routes.LOGIN);
      } else {
        print('Registration failed: ${res['message']}');
      }
    } else {
      print('Server error: ${response.statusCode}');
    }
  }

//getproduk
  var Allproducts = [].obs;
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
    Allproducts.value = data;

    return Allproducts;
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

  //get orderby retoran
  Future<List<OrderRestodata>?> getorderbyrestoran() async {
    var user = await LocalData().getAuthData();
    var token = user?.data?.token;
    var id = user?.data?.user?.id;

    var respon = await http
        .get(Uri.parse('$urlApi/api/restaurant/$id/orders'), headers: {
      "Authorization": "Bearer ${token}",
    });

    if (respon.statusCode == 200) {
      var res = jsonDecode(respon.body);
      print("dari resto init");
      print(id);

      var data = res['data'];

      var Orderretoran = data
          .map((item) => OrderRestodata.fromMap(item))
          .toList()
          .cast<OrderRestodata>();
      return Orderretoran;
    } else {
      print("dari resto init");
      print(respon.body);
    }
    return null;
  }

  List<DataOrderItem> order = [];
//get products by order
  Future getproductsbyorder(int? id) async {
    var user = await LocalData().getAuthData();
    var token = user?.data?.token;
    var respon =
        await http.get(Uri.parse('$urlApi/api/order/$id/products'), headers: {
      "Authorization": "Bearer ${token}",
    });

    if (respon.statusCode == 200) {
      var res = jsonDecode(respon.body)['data'];
      order = res
          .map((item) => DataOrderItem.fromMap(item))
          .toList()
          .cast<DataOrderItem>();
      print("cek produk order");
      print(res);
    } else {
      print("cek produk order");
      print(respon.body);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getproduk();
  }
}
