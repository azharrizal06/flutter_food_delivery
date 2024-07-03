import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models/product_model.dart';
import '../widgets/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      [
        ProductModel(
          imageUrl:
              'https://cdn.pixabay.com/photo/2019/11/21/18/28/gopchang-4643143_640.jpg',
          name: 'Ayam Bakar',
          description: 'Ayam yang dibumbui dengan campuran rempah khas',
          price: 32000,
          quantity: 1,
          createdAt: DateTime.now().subtract(const Duration(seconds: 13)),
        ),
        ProductModel(
          imageUrl:
              'https://cdn.idntimes.com/content-images/community/2022/05/img-20220505-090628-6d2cbb4bbec2340f770674be006d2944-242a598410a0b5610ba0c2d3bc499931.jpg',
          name: 'Pecel Ayam',
          description: 'Ayam yang dibumbui dengan campuran rempah khas',
          price: 25000,
          quantity: 2,
          createdAt: DateTime.now().subtract(const Duration(seconds: 23)),
        ),
      ],
      [
        ProductModel(
          imageUrl:
              'https://cdn.idntimes.com/content-images/community/2022/05/img-20220505-090628-6d2cbb4bbec2340f770674be006d2944-242a598410a0b5610ba0c2d3bc499931.jpg',
          name: 'Pecel Ayam',
          description: 'Ayam yang dibumbui dengan campuran rempah khas',
          price: 25000,
          quantity: 2,
          createdAt: DateTime.now().subtract(const Duration(seconds: 33)),
        ),
        ProductModel(
          imageUrl:
              'https://cdn.pixabay.com/photo/2019/11/21/18/28/gopchang-4643143_640.jpg',
          name: 'Ayam Bakar',
          description: 'Ayam yang dibumbui dengan campuran rempah khas',
          price: 32000,
          quantity: 1,
          createdAt: DateTime.now().subtract(const Duration(seconds: 43)),
        ),
        ProductModel(
          imageUrl:
              'https://cdn.idntimes.com/content-images/community/2022/05/img-20220505-090628-6d2cbb4bbec2340f770674be006d2944-242a598410a0b5610ba0c2d3bc499931.jpg',
          name: 'Pecel Ayam',
          description: 'Ayam yang dibumbui dengan campuran rempah khas',
          price: 25000,
          quantity: 2,
          createdAt: DateTime.now().subtract(const Duration(seconds: 57)),
        ),
      ],
      [
        ProductModel(
          imageUrl:
              'https://cdn.pixabay.com/photo/2019/11/21/18/28/gopchang-4643143_640.jpg',
          name: 'Ayam Bakar',
          description: 'Ayam yang dibumbui dengan campuran rempah khas',
          price: 32000,
          quantity: 1,
          createdAt: DateTime.now().subtract(const Duration(seconds: 66)),
        ),
      ],
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: orders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.alert.empty.svg(),
                  const SpaceHeight(20.0),
                  const Text(
                    'Riwayat pesanan akan  kamu lihat di sini',
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
              itemCount: orders.length,
              separatorBuilder: (context, index) => const SpaceHeight(10.0),
              itemBuilder: (context, index) => HistoryCard(
                histories: orders[index],
              ),
            ),
    );
  }
}
