import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:food_delivery/app/modules/home/views/payment_page.dart';
import 'package:get/get.dart';

import '../../../DataRespon/respon_restoran.dart';
import '../../../core/core.dart';
import '../widgets/order_card.dart';
import '../widgets/order_delivery_address.dart';
import '../widgets/order_summary.dart';

class OrderPage extends StatefulWidget {
  OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final HomeController homeController = Get.find<HomeController>();
  DataResto? resto = Get.arguments;
  void initState() {
    super.initState();
    homeController.getuser();
    print("proses ini calkulet");
    homeController.calculateDistance(homeController.datarestoletar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: Obx(
        () {
          var orders = homeController.orders;

          return orders.isEmpty
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
                      separatorBuilder: (context, index) =>
                          const SpaceHeight(10.0),
                      itemBuilder: (context, index) => OrderCard(
                        item: orders[index],
                      ),
                    ),
                    const SpaceHeight(40.0),
                    OrderSummary(
                        // ongkos: ongkos.value,
                        ),
                    const SpaceHeight(36.0),
                    Button.filled(
                      onPressed: () {
                        context.push(PaymentPage());
                        // homeController.pesan_sekarang();
                      },
                      label: 'Bayar Sekarang',
                    ),
                    const SpaceHeight(30.0),
                  ],
                );
        },
      ),
    );
  }
}
