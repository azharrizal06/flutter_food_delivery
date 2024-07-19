import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/data/LocalData.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var AuthData = await LocalData().isAuth();
  var user = await LocalData().getAuthData();
  var userAuth = user?.data?.user?.roles;
  print(user?.data?.user?.roles);
  print("main atuh data");
  print(AuthData);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AuthData == false || userAuth == null
          ? Routes.LOGIN
          : userAuth == "user"
              ? Routes.HOME
              : Routes.RESTO,
      getPages: AppPages.routes,
    ),
  );
}
