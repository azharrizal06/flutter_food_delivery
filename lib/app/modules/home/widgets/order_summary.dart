import 'package:flutter/material.dart';

import '../../../core/core.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

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
              Text(
                45000.currencyFormatRp,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray3,
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
                10000.currencyFormatRp,
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
                55000.currencyFormatRp,
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
