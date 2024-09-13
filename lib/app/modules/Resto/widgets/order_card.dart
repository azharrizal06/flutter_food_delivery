import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../help/Api.dart';
import '../models/orderItemeresto.dart';

class OrderCard extends StatelessWidget {
  final DataOrderItem item;
  const OrderCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => context.push(OrderDetailPage(
      //   order: [item],
      // )),
      child: Container(
        // padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 8.0,
              spreadRadius: 0,
              color: AppColors.stroke.withOpacity(0.5),
              blurStyle: BlurStyle.outer,
            )
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: CachedNetworkImage(
                imageUrl: '${urlApi}/uploads/${item.image}' ?? '',
                fit: BoxFit.cover,
                width: 90.0,
                height: 90.0,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
            const SpaceWidth(8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name ?? '',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SpaceHeight(4.0),
                SizedBox(
                  width: context.deviceWidth - 182.0,
                  child: Text(
                    item.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray2,
                    ),
                  ),
                ),
                Row(
                  children: [
                    // SizedBox(
                    //   width: context.deviceWidth - 270.0,
                    //   child:
                    //   Text(
                    //     item.priceFormatted,
                    //     style: const TextStyle(
                    //       fontSize: 16.0,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 108.0,
                    //   child: Align(
                    //     alignment: Alignment.centerRight,
                    //     child: Container(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 16.0, vertical: 8.0),
                    //       decoration: BoxDecoration(
                    //         color: AppColors.primary,
                    //         borderRadius: BorderRadius.circular(16.0),
                    //       ),
                    //       child: Text(
                    //         item.status.toTitleCase,
                    //         style: const TextStyle(
                    //           fontSize: 12.0,
                    //           color: AppColors.white,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
