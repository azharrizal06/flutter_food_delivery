import 'package:flutter/material.dart';

import '../../../core/core.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(),
            Assets.images.orderComplete.image(),
            const SpaceHeight(22.0),
            const Text(
              'Yeay! pesanan Anda telah tiba',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SpaceHeight(10.0),
            const Text(
              'Selamat menikmati pesanan anda, jangan lupa berikan rating kepada driver dan merchant. Terima kasih!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.gray3,
              ),
            ),
            const Spacer(),
            Button.filled(
              onPressed: () {
                context.popToRoot();
              },
              label: 'Continue Shopping',
            ),
          ],
        ),
      ),
    );
  }
}
