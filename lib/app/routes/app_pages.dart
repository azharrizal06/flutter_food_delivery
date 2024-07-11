import 'package:get/get.dart';

import '../modules/Driver/bindings/driver_binding.dart';
import '../modules/Driver/views/driver_view.dart';
import '../modules/Resto/bindings/resto_binding.dart';
import '../modules/Resto/views/resto_view.dart';
import '../modules/daftar/bindings/daftar_binding.dart';
import '../modules/daftar/views/daftar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DRIVER,
      page: () => DriverView(),
      binding: DriverBinding(),
    ),
    GetPage(
      name: _Paths.RESTO,
      page: () => RestoView(),
      binding: RestoBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR,
      page: () => DaftarView(),
      binding: DaftarBinding(),
    ),
  ];
}
