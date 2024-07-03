import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/Resto/models/order_model.dart';

import '../../../core/core.dart';
import '../widgets/order_card.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      OrderModel(
        imageUrl:
            'https://cdn.pixabay.com/photo/2019/11/21/18/28/gopchang-4643143_640.jpg',
        name: 'Ayam Bakar',
        description: 'Ayam yang dibumbui dengan campuran rempah khas',
        price: 32000,
        status: 'proses',
      ),
      OrderModel(
        imageUrl:
            'https://cdn.idntimes.com/content-images/community/2022/05/img-20220505-090628-6d2cbb4bbec2340f770674be006d2944-242a598410a0b5610ba0c2d3bc499931.jpg',
        name: 'Pecel Ayam',
        description: 'Ayam yang dibumbui dengan campuran rempah khas',
        price: 25000,
        status: 'selesai',
      ),
      OrderModel(
        imageUrl:
            'https://cdn.idntimes.com/content-images/community/2022/05/img-20220505-090628-6d2cbb4bbec2340f770674be006d2944-242a598410a0b5610ba0c2d3bc499931.jpg',
        name: 'Sate Kelinci',
        description: 'Sate kelinci muda dengan olahran rempah Nusantara',
        price: 35000,
        status: 'proses_kirim',
      ),
      OrderModel(
        imageUrl:
            'https://cdn.pixabay.com/photo/2019/11/21/18/28/gopchang-4643143_640.jpg',
        name: 'Ayam Bakar',
        description: 'Ayam yang dibumbui dengan campuran rempah khas',
        price: 32000,
        status: 'proses_kirim',
      ),
      OrderModel(
        imageUrl:
            'https://cdn.idntimes.com/content-images/community/2022/05/img-20220505-090628-6d2cbb4bbec2340f770674be006d2944-242a598410a0b5610ba0c2d3bc499931.jpg',
        name: 'Pecel Ayam',
        description: 'Ayam yang dibumbui dengan campuran rempah khas',
        price: 25000,
        status: 'proses_kirim',
      ),
      OrderModel(
        imageUrl:
            'https://cdn.idntimes.com/content-images/community/2022/05/img-20220505-090628-6d2cbb4bbec2340f770674be006d2944-242a598410a0b5610ba0c2d3bc499931.jpg',
        name: 'Sate Kelinci',
        description: 'Sate kelinci muda dengan olahran rempah Nusantara',
        price: 35000,
        status: 'proses',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pesanan'),
      ),
      body: orders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.alert.empty.svg(),
                  const SpaceHeight(20.0),
                  const Text(
                    'Belum ada Pesanan',
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
              separatorBuilder: (context, index) => const SpaceHeight(18.0),
              itemBuilder: (context, index) => OrderCard(
                item: orders[index],
              ),
            ),
    );
  }
}
