import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../DataRespon/Respon_login.dart';
import '../DataRespon/respon_user.dart';

class LocalData {
  Future<void> savedata(ResponDataLogin responDataLogin) async {
    try {
      final pref = await SharedPreferences.getInstance();
      await pref.setString("auth_data", responDataLogin.toJson());

      print("esponDataLogin.toJson()");
      print(responDataLogin.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<ResponDataLogin?> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    var data = await pref.getString("auth_data");
    print(data);
    if (data == null) {
      return null;
    }
    return ResponDataLogin.fromJson(data);
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove("auth_data");
  }

  Future<bool> isAuth() async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey("auth_data");
  }

  Future<void> saveUser(UserModel responDataLogin) async {
    try {
      final pref = await SharedPreferences.getInstance();
      String userJson = jsonEncode(responDataLogin.toJson());
      await pref.setString("user", userJson);

      print("esponDataLogin.toJson()");
      print(responDataLogin.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<UserModel?> getUser() async {
    final pref = await SharedPreferences.getInstance();
    var data = pref.getString("user");
    print(data);
    if (data == null) {
      return null;
    }

    // Mengurai JSON string menjadi Map<String, dynamic>
    Map<String, dynamic> userMap = jsonDecode(data);

    // Mengonversi Map menjadi UserModel menggunakan fromJson
    return UserModel.fromJson(userMap);
  }
}
