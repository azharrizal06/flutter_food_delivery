import 'package:flutter/material.dart';

import '../../../core/core.dart';

class OrderDeliveryAddress extends StatelessWidget {
  const OrderDeliveryAddress({super.key});

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
                onPressed: () {},
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jalan Kampung Flutter No 20',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: AppColors.gray3,
                    ),
                  ),
                  Text(
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
