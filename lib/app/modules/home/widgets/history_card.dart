import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models/product_model.dart';
import '../views/history_detail_page.dart';
import 'history_product_card.dart';

class HistoryCard extends StatelessWidget {
  final List<ProductModel> histories;
  const HistoryCard({super.key, required this.histories});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: AppColors.stroke,
        ),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: histories.length,
            separatorBuilder: (context, index) => const SpaceHeight(18.0),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  HistoryProductCard(item: histories[index]),
                  if (index == histories.length - 1) ...[
                    const SpaceHeight(18.0),
                    const DottedDivider(
                      color: AppColors.stroke,
                      dashWidth: 4,
                    ),
                    const SpaceHeight(10.0),
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
                          histories[index].createdAt.toFormattedDateTime(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              );
            },
          ),
          Button.outlined(
            onPressed: () => context.push(HistoryDetailPage(
              histories: histories,
            )),
            label: 'Detail',
            borderRadius: 32.0,
            height: 35.0,
            width: 85.0,
            fontSize: 12.0,
          ),
        ],
      ),
    );
  }
}
