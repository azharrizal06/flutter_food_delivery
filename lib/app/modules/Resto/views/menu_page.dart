import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models/menu_model.dart';
import '../widgets/form_menu_bottom_sheet.dart';
import '../widgets/menu_card.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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
      body: menus.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.alert.empty.svg(),
                  const SpaceHeight(20.0),
                  const Text(
                    'Belum ada Menu',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemCount: menus.length,
              separatorBuilder: (context, index) => const SpaceHeight(12.0),
              itemBuilder: (context, index) => MenuCard(
                item: menus[index],
              ),
            ),
    );
  }
}
