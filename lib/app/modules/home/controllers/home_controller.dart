import 'dart:convert';

import 'package:food_delivery/app/modules/home/models/restoproduk.dart';
import 'package:food_delivery/app/modules/home/views/order_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../DataRespon/Respon_login.dart';
import '../../../DataRespon/respon_user.dart';
import '../../../data/LocalData.dart';
import '../../../help/Api.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  var DataUser = ResponDataLogin().obs;
  var produk = <Restoproduk>[]
      .obs; // Disarankan menggunakan tipe yang lebih spesifik daripada List kosong
  var orders = <Restoproduk>[].obs;
  var total = 0.0.obs;

  Future<Rx<ResponDataLogin>> getData() async {
    var data = await LocalData().getAuthData();
    print("data?.data?.token");
    print(data?.data?.token);

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
    } else {
      // Handle error
      print("Failed to load restaurants: ${response.statusCode}");
      return null;
    }
  }

  Future<List<Restoproduk>?> getprodukrestoran(int id) async {
    var uri = Uri.parse('$urlApi/api/restaurant/$id/products');
    var response = await http.get(uri, headers: {
      "Authorization":
          "Bearer ${DataUser.value.data?.token}", // Aktifkan Authorization jika diperlukan
    });

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);

      // Parsing JSON menjadi list ProductModel
      List<Restoproduk> produkList = (res['data'] as List)
          .map((item) => Restoproduk.fromJson(item))
          .toList();

      // Simpan produk ke dalam variabel produk (misalnya menggunakan GetX atau State Management lain)
      produk.value = produkList;

      // Cetak hasil untuk debug
      print("get all restaurant products");
      print(produkList);

      return produkList;
    } else {
      // Handle error
      print("Failed to load products: ${response.statusCode}");
      return null;
    }
  }

  void addProduct(Restoproduk product) {
    int index = orders.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      orders[index].quantity += 1;
      print("Updated quantity for: ${product.name}");
    } else {
      product.quantity = 1;
      orders.add(product);

      Get.to(OrderPage());
      print("Added new product: ${product.name}");
    }
    calculateTotal();
  }

  void removeProduct(Restoproduk product) {
    print("Removing product: ${product.name}");
    orders.remove(product);
    calculateTotal();
    print("Current orders: ${orders.length}");
  }

  void calculateTotal() {
    total.value =
        orders.fold(0, (sum, item) => sum + item.price * item.quantity);

    print("Total: $total");
  }

  // Method untuk mengurangi kuantitas produk
  void kurangjumlah(Restoproduk product) {
    int index = orders.indexWhere((item) => item.id == product.id);

    if (index != -1 && orders[index].quantity > 1) {
      orders[index].quantity -= 1;
      print("Decreased quantity for: ${product.name}");
    } else if (index != -1) {
      orders.removeAt(index);
      print("Removed product: ${product.name}");
    }
    calculateTotal();
  }

  // Method untuk menambah kuantitas produk
  void tambahjumlah(Restoproduk product) {
    int index = orders.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      orders[index].quantity += 1;
      print(orders[index].quantity);
      print("Increased quantity for: ${product.name}");
    } else {
      product.quantity = 1;
      orders.add(product);
      print("Added new product: ${product.name}");
    }
    calculateTotal();
  }

  RxString addres = "".obs;
  //updateLatLong
  Future<UserModel?> updateLatLong(
    double latitude,
    double longitude,
    String address,
  ) async {
    try {
      final authData = await LocalData().getAuthData();
      final header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.data!.token}',
      };

      final url = Uri.parse('${urlApi}/api/user/updateLatLong');
      final response = await http.post(
        url,
        headers: header,
        body: jsonEncode(
          {'latlong': '$latitude,$longitude', 'address': address},
        ),
      );

      if (response.statusCode == 200) {
        // Menguraikan response body menjadi Map<String, dynamic>
        final Map<String, dynamic> responseModel = jsonDecode(response.body);

        // Mengonversi Map menjadi ResponDataLogin menggunakan fromMap
        final UserModel resModel = UserModel.fromMap(responseModel['data']);

        // Simpan data pengguna yang diperbarui ke local storage
        await LocalData().saveUser(resModel);

        print(resModel.address); // Contoh akses data
        Get.back();
        getuser();
        return resModel;
      } else {
        print("Failed to update user location: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }

  void getuser() {
    LocalData().getUser().then((value) {
      if (value != null) {
        addres.value = value.address ?? "belum ada alamat";
      }
    });
  }
}
