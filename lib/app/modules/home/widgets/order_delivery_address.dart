import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../views/edit_alamat.dart';

class OrderDeliveryAddress extends StatefulWidget {
  const OrderDeliveryAddress({super.key});

  @override
  State<OrderDeliveryAddress> createState() => _OrderDeliveryAddressState();
}

class _OrderDeliveryAddressState extends State<OrderDeliveryAddress> {
  HomeController homeController = Get.find<HomeController>();
  // var addres;
  // @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Delivery address',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Button.outlined(
                onPressed: () {
                  Get.to(ChangeAddressPage());
                },
                label: 'Ubah',
                height: 30.0,
                width: 80.0,
                fontSize: 12.0,
                borderRadius: 32.0,
              ),
            ],
          ),
          const SpaceHeight(16.0),
          Row(
            children: [
              ClipOval(
                child: ColoredBox(
                  color: AppColors.background,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Assets.icons.location.svg(),
                  ),
                ),
              ),
              const SpaceWidth(8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Container(
                      width: Get.width * 0.7,
                      child: Text(
                        '${homeController.addres}',
                        maxLines: 3, // Membatasi teks hingga 3 baris
                        overflow: TextOverflow
                            .ellipsis, // Menampilkan ... jika teks melebihi batas
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                          color: AppColors.gray3,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Home',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: AppColors.gray3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
