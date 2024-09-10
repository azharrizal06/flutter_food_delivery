import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/home/views/history_page.dart';
import 'package:food_delivery/app/modules/home/views/home_page.dart';
import 'package:get/get.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../help/appColors.dart';
import '../controllers/home_controller.dart';
import 'order_page.dart';
import 'profile_page.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  RxInt _selectedIndex = 0.obs;
  final _widgets = [
    HomePage(),
    OrderPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: _selectedIndex.value,
          children: _widgets,
        ),
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
          child: Obx(
            () => BottomNavigationBar(
              backgroundColor: AppColors.white,
              useLegacyColorScheme: false,
              currentIndex: _selectedIndex.value,
              onTap: _selectedIndex,
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
                  icon: Assets.icons.nav.order.svg(
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 1
                          ? AppColors.primary
                          : AppColors.navPlaceholder,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Order',
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.nav.history.svg(
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 2
                          ? AppColors.primary
                          : AppColors.navPlaceholder,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'History',
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
