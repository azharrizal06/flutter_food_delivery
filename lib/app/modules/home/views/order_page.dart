import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models/product_model.dart';
import '../widgets/order_card.dart';
import '../widgets/order_delivery_address.dart';
import '../widgets/order_summary.dart';
import 'payment_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
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
        quantity: 1,
        createdAt: DateTime.now().subtract(const Duration(seconds: 13)),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
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
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                const SpaceHeight(16.0),
                const OrderDeliveryAddress(),
                const SpaceHeight(20.0),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orders.length,
                  separatorBuilder: (context, index) => const SpaceHeight(10.0),
                  itemBuilder: (context, index) => OrderCard(
                    item: orders[index],
                  ),
                ),
                const SpaceHeight(40.0),
                const OrderSummary(),
                const SpaceHeight(36.0),
                Button.filled(
                  onPressed: () {
                    context.push(const PaymentPage());
                  },
                  label: 'Pesan Sekarang',
                ),
                const SpaceHeight(30.0),
              ],
            ),
    );
  }
}
