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
    resto_controller.getorderbyrestoran();
  }

  @override
  Widget build(BuildContext context) {
    print("coba ada ngga");
    print(orders.length);
    return Scaffold(body: Obx(() {
      orders = resto_controller.orderResto;
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
                  ElevatedButton(
                    onPressed: () {
                      resto_controller.getorderbyrestoran();
                    },
                    child: const Text('Kembali'),
                  )
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Order : ${orders[index].totalBill!.currencyFormatRp}"),
                                Text(
                                  orders[index].status.toString(),
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                    child: Text(
                                  orders[index].shippingAddress.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12.0),
                                )),
                                SizedBox(
                                  width: 108.0,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () async {
                                        // print(orders[index].status);
                                        await resto_controller
                                            .getproductsbyorder(
                                                orders[index].id);

                                        Get.to(() => OrderPage(
                                              data: orders[index],
                                            ));
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
                            SizedBox(
                              height: 10,
                            ),
                            if (orders[index].status == 'pending')
                              Expanded(
                                child: Button.filled(
                                  color: AppColors.primary,
                                  onPressed: () {
                                    resto_controller.updatestatusorder(
                                        orders[index].id!.toInt(), 'proses');
                                  },
                                  label: 'Terima Pesanan',
                                ),
                              )
                            else if (orders[index].status == 'proses')
                              Expanded(
                                child: Button.filled(
                                  color: AppColors.primary,
                                  onPressed: () {
                                    resto_controller.updatestatusorder(
                                        orders[index].id!.toInt(), 'selesai');
                                  },
                                  label: 'Pesanan Selesai',
                                ),
                              )
                            else if (orders[index].status == 'selesai')
                              Expanded(
                                child: Button.filled(
                                  color: AppColors.gray1,
                                  onPressed: () {
                                    resto_controller.updatestatusorder(
                                        orders[index].id!.toInt(), 'selesai');
                                  },
                                  label: 'pesanan di kirim',
                                ),
                              )
                          ]),
                    ),
                  ),
                );
              });
    }));
  }
}

class OrderPage extends StatelessWidget {
  OrderRestodata? data;
  OrderPage({super.key, this.data});
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
          : Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20.0),
                    itemCount: orders.length,
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(18.0),
                    itemBuilder: (context, index) => OrderCard(
                      item: orders[index],
                    ),
                  ),
                  const SpaceHeight(18.0),
                  const Divider(),
                  const SpaceHeight(24.0),
                  const Text(
                    'Detail Pesanan',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SpaceHeight(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'No Pesanan',
                        style: TextStyle(
                          color: AppColors.gray3,
                        ),
                      ),
                      Text(
                        '${data?.id}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tanggal Pesanan',
                        style: TextStyle(
                          color: AppColors.gray3,
                        ),
                      ),
                      Text(
                        data!.createdAt.toString().split(" ")[0],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Atas Nama',
                        style: TextStyle(
                          color: AppColors.gray3,
                        ),
                      ),
                      Text(
                        'Azhar',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(40.0),
                  const Text(
                    'Rincian Biaya',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SpaceHeight(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Harga',
                        style: TextStyle(
                          color: AppColors.gray3,
                        ),
                      ),
                      Text(
                        data!.totalPrice!.currencyFormatRp,
                        style: const TextStyle(
                          color: AppColors.gray3,
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ongkos Kirim',
                        style: TextStyle(
                          color: AppColors.gray3,
                        ),
                      ),
                      Text(
                        data!.shippingCost!.currencyFormatRp,
                        style: const TextStyle(
                          color: AppColors.gray3,
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(20.0),
                  const DottedDivider(),
                  const SpaceHeight(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Pembayaran',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        data!.totalBill!.currencyFormatRp,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(30.0),
                ],
              ),
            ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(18.0),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       if (data?.status == 'pending')
      //         Button.filled(
      //           color: AppColors.primary,
      //           onPressed: () {},
      //           label: 'Pesanan',
      //         )
      //       else if (data?.status == 'proses_kirim')
      //         Button.filled(
      //           color: AppColors.primary,
      //           onPressed: () {},
      //           label: 'Selesaikan Pesanan',
      //         )
      //       else if (data?.status == 'selesai')
      //         Button.filled(
      //           color: AppColors.primary,
      //           onPressed: () {},
      //           label: 'Proses Kirim',
      //         )
      //     ],
      //   ),
      // ),
    );
  }
}
