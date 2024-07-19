import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models/order_model.dart';
import '../widgets/order_product_card.dart';

class OrderDetailPage extends StatelessWidget {
  final List<OrderModel> order;
  const OrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        children: [
          const Text(
            'Daftar Pesanan',
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
            itemCount: order.length,
            separatorBuilder: (context, index) => const Divider(height: 36.0),
            itemBuilder: (context, index) => OrderProductCard(
              item: order[index],
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
          const Row(
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
          const Row(
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
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (order.first.status == 'proses')
              Button.filled(
                onPressed: () {},
                label: 'Proses Sekarang',
              )
            else if (order.first.status == 'proses_kirim')
              Button.filled(
                onPressed: () {},
                label: 'Selesaikan Pesanan',
              )
            else if (order.first.status == 'selesai')
              Button.filled(
                onPressed: () {},
                label: 'Proses Kirim',
              )
          ],
        ),
      ),
    );
  }
}
