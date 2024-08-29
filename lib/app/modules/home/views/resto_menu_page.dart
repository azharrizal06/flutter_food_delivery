import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../DataRespon/respon_restoran.dart';
import '../../../core/components/components.dart';
import '../widgets/choose_menu.dart';
import '../widgets/resto_header.dart';

class RestoMenuPage extends StatelessWidget {
  RestoMenuPage({super.key, required this.resto});

  // final RestoModel item;
  late DataResto resto;

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homeController.datarestoletar = resto;
    return Scaffold(
      body: ListView(
        children: [
          RestoHeader(),
          SpaceHeight(30.0),
          ChooseMenu(),
          SpaceHeight(30.0),
        ],
      ),
    );
  }
}
