import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/data/LocalData.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var AuthData = await LocalData().isAuth();
  print("main atuh data");
  print(AuthData);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AuthData == false ? Routes.LOGIN : Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}
