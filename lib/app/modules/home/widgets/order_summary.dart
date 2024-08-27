import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controllers/home_controller.dart';

class OrderSummary extends StatelessWidget {
  OrderSummary({super.key});
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivery address',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpaceHeight(16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Harga',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray3,
                ),
              ),
              Obx(
                () => Text(
                  homeController.total.value.currencyFormatRp,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray3,
                  ),
                ),
              ),
            ],
          ),
          const SpaceHeight(8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Biaya Pengiriman',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray3,
                ),
              ),
              Text(
                1000000.currencyFormatRp,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray3,
                ),
              ),
            ],
          ),
          const SpaceHeight(8.0),
          const Divider(),
          const SpaceHeight(8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Belanja',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                homeController.total.value.currencyFormatRp,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
