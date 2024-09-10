import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/firebase_options.dart';
import 'package:get/get.dart';

import 'app/data/LocalData.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.lazyPut<HomeController>(() => HomeController());
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
