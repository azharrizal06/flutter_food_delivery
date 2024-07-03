import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models/product_model.dart';

class HistoryProductCard extends StatelessWidget {
  final ProductModel item;
  const HistoryProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl: item.imageUrl,
            fit: BoxFit.cover,
            width: 78.0,
            height: 78.0,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
          ),
        ),
        const SpaceWidth(18.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SpaceHeight(18.0),
            Text(
              '${item.priceFormatted} (${item.quantity})',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.gray3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
