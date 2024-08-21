import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/assets/assets.dart';
import '../../../core/components/components.dart';
import '../../../core/constants/colors.dart';
import '../controllers/resto_controller.dart';
import '../widgets/home_menu_tile.dart';

class HomeRestoPage extends StatefulWidget {
  HomeRestoPage({super.key});

  @override
  State<HomeRestoPage> createState() => _HomeRestoPageState();
}

class _HomeRestoPageState extends State<HomeRestoPage> {
  final RestoController controllerresto = Get.put(RestoController());

  @override
  void initState() {
    super.initState();
    print("getdata");
    controllerresto.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 50.0,
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.stroke),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Statistik Resto',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SpaceHeight(60.0),
                  Row(
                    children: [
                      Expanded(
                        child: HomeMenuTile(
                          label: 'Jumlah Pesanan',
                          info: '38 Pesanan',
                          iconSvgPath:
                              Assets.icons.homeResto.jumlahPesanan.path,
                          color: AppColors.homeGreen,
                          onPressed: () {},
                        ),
                      ),
                      const SpaceWidth(14.0),
                      Expanded(
                        child: HomeMenuTile(
                          label: 'Menu',
                          info: '20 Produk',
                          iconSvgPath: Assets.icons.homeResto.menu.path,
                          color: AppColors.homeBlue,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(12.0),
                  Row(
                    children: [
                      Expanded(
                        child: HomeMenuTile(
                          label: 'Transaksi Hari Ini',
                          info: '38 Transaksi',
                          iconSvgPath:
                              Assets.icons.homeResto.transaksiHariIni.path,
                          color: AppColors.homeYellow,
                          onPressed: () {},
                        ),
                      ),
                      const SpaceWidth(14.0),
                      Expanded(
                        child: HomeMenuTile(
                          label: 'Pemasukan',
                          info: 'Rp. 400.000',
                          iconSvgPath: Assets.icons.homeResto.pemasukan.path,
                          color: AppColors.homePurple,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
