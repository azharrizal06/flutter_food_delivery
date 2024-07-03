import 'package:shared_preferences/shared_preferences.dart';

import '../DataRespon/Respon_login.dart';

class LocalData {
  Future<void> savedata(ResponDataLogin responDataLogin) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("auth_data", responDataLogin.toJson());
  }

  Future<ResponDataLogin> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    var data = await pref.getString("auth_data");
    print(data);
    return ResponDataLogin.fromJson(data!);
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove("auth_data");
  }

  Future<bool> isAuth() async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey("auth_data");
  }
}
