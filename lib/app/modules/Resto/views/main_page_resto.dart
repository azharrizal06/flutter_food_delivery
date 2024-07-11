import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'home_page.dart';
import 'menu_page.dart';
import 'order_page.dart';
import 'profile_resto_page.dart';

class MainPageResto extends StatefulWidget {
  const MainPageResto({super.key});

  @override
  State<MainPageResto> createState() => _MainPageRestoState();
}

class _MainPageRestoState extends State<MainPageResto> {
  int _selectedIndex = 0;
  final _widgets = [
    const HomeRestoPage(),
    MenuPage(),
    const OrderPage(),
    ProfileRestoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
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
            currentIndex: _selectedIndex,
            onTap: (value) => setState(() => _selectedIndex = value),
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
    );
  }
}
