import 'package:flutter/material.dart';
import 'package:food_delivery/app/help/Api.dart';
import 'package:get/get.dart';

import '../../../core/components/spaces.dart';
import '../controllers/resto_controller.dart';
import '../models/menu_model.dart';
import '../widgets/form_menu_bottom_sheet.dart';
import '../widgets/menu_card.dart';

class MenuPage extends StatefulWidget {
  MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final resto_controller = Get.put(RestoController());

  void initState() {
    super.initState();
    print("init nih");
    resto_controller.getproduk();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (context) => const FormMenuBottomSheet(),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Obx(
          () => ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemCount: resto_controller.Allproducts.length,
              separatorBuilder: (context, index) => const SpaceHeight(12.0),
              itemBuilder: (context, index) {
                var data = resto_controller.Allproducts[index];

                return MenuCard(
                    id: data['id'],
                    item: MenuModel(
                        imageUrl: '${urlApi}/uploads/${data['image']}' ?? '',
                        name: data['name'],
                        price: data['price'],
                        stock: data['stock']));
              }),
        ));
  }
}
