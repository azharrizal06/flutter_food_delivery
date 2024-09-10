import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/Resto/controllers/resto_controller.dart';
import 'package:food_delivery/app/modules/Resto/models/Order_resto.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../models/orderItemeresto.dart';
import '../widgets/order_card.dart';

class Orderdetail extends StatefulWidget {
  const Orderdetail({super.key});

  @override
  State<Orderdetail> createState() => _OrderdetailState();
}

class _OrderdetailState extends State<Orderdetail> {
  RestoController resto_controller = Get.put(RestoController());
  List<OrderRestodata> orders = [];
  void initState() {
    super.initState();
    resto_controller.getorderbyrestoran().then((value) {
      setState(() {
        orders = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Order : ${orders[index].totalBill!.currencyFormatRp}"),
                                  Text(
                                    orders[index].status.toString(),
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    orders[index].shippingAddress.toString(),
                                    style: TextStyle(fontSize: 12.0),
                                  )),
                                  SizedBox(
                                    width: 108.0,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () async {
                                          print(orders[index].id);
                                          await resto_controller
                                              .getproductsbyorder(
                                                  orders[index].id);

                                          Get.to(() => OrderPage());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: const Text(
                                            "Lihat Detail",
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  );
                }));
  }
}

class OrderPage extends StatelessWidget {
  OrderPage({super.key});
  RestoController resto_controller = Get.put(RestoController());
  @override
  Widget build(BuildContext context) {
    List<DataOrderItem> orders = resto_controller.order;
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
