import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/Resto/views/home_page.dart';
import 'package:food_delivery/app/modules/Resto/views/menu_page.dart';
import 'package:food_delivery/app/modules/Resto/views/profile_resto_page.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../home/views/order_page.dart';
import '../controllers/resto_controller.dart';

class RestoView extends GetView<RestoController> {
  RestoView({Key? key}) : super(key: key);
  RxInt _selectedIndex = 0.obs;
  final _widgets = [
    HomeRestoPage(),
    MenuPage(),
    OrderPage(),
    ProfileRestoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: _selectedIndex.value,
          children: _widgets,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.stroke),
          ),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.white,
              highlightColor: Colors.white,
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.white,
              useLegacyColorScheme: false,
              currentIndex: _selectedIndex.value,
              onTap: (value) => _selectedIndex.value = value,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(color: AppColors.primary),
              selectedIconTheme: const IconThemeData(color: AppColors.primary),
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Assets.icons.nav.home.svg(
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 0
                          ? AppColors.primary
                          : AppColors.navPlaceholder,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.nav.menu.svg(
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 1
                          ? AppColors.primary
                          : AppColors.navPlaceholder,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Menu',
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.nav.order.svg(
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 2
                          ? AppColors.primary
                          : AppColors.navPlaceholder,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Pesanan',
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.nav.profile.svg(
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 3
                          ? AppColors.primary
                          : AppColors.navPlaceholder,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
