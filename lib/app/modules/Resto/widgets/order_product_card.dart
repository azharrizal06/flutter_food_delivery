import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../help/Api.dart';
import '../models/orderItemeresto.dart';

class OrderProductCard extends StatelessWidget {
  final DataOrderItem item;
  const OrderProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl: '${urlApi}/uploads/${item.image}' ?? '',
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
              item.name ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SpaceHeight(18.0),
            Text(
              '${item.price!.currencyFormatRp}',
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
