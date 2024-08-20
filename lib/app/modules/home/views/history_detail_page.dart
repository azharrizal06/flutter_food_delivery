import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models/product_model.dart';
import '../widgets/history_product_card.dart';
import 'order_status.dart';

class HistoryDetailPage extends StatelessWidget {
  final List<ProductModel> histories;
  const HistoryDetailPage({super.key, required this.histories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        children: [
          const Text(
            'Metode Pembayaran',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SpaceHeight(12.0),
          Image.asset(
            alignment: Alignment.centerLeft,
            Assets.images.payments.ovo.path,
            height: 30.0,
          ),
          const SpaceHeight(6.0),
          const Text(
            'Bayar melalui ewallet',
            style: TextStyle(
              fontSize: 12.0,
              color: AppColors.gray3,
            ),
          ),
          const SpaceHeight(30.0),
          const Text(
            'Pesanan Kamu',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SpaceHeight(20.0),
          const DottedDivider(),
          const SpaceHeight(18.0),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: histories.length,
            separatorBuilder: (context, index) => const Divider(height: 36.0),
            itemBuilder: (context, index) => HistoryProductCard(
              item: histories[index],
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
                'ABC-123-DE',
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
                DateTime.now().toFormattedDateTime(),
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
                'Saiful Bahri',
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
                75000.currencyFormatRp,
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
                10000.currencyFormatRp,
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
                85000.currencyFormatRp,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SpaceHeight(30.0),
          Button.filled(
            onPressed: () {
              context.push(const OrderStatus());
            },
            label: 'Lihat Pesanan',
          ),
        ],
      ),
    );
  }
}
