import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/help/Api.dart';
import 'package:food_delivery/app/modules/home/widgets/loading.dart';

import '../../../DataRespon/respon_restoran.dart';
import '../../../core/core.dart';
import '../views/resto_menu_page.dart';

class RestoCard extends StatelessWidget {
  final DataResto item;
  RestoCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(RestoMenuPage(
        resto: item,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                  width: context.deviceWidth,
                  height: 110.0,
                  fit: BoxFit.cover,
                  imageUrl: "$urlApi/images/${item.photo}",
                  placeholder: (context, url) => loading(context)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceHeight(8.0),
                Text(
                  item.restaurantName ?? '',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Assets.icons.location.svg(
                      width: 16.0,
                      height: 16.0,
                      colorFilter: const ColorFilter.mode(
                          AppColors.gray3, BlendMode.srcIn),
                    ),
                    const SpaceWidth(4.0),
                    SizedBox(
                      width: context.deviceWidth - 264.0,
                      child: Text(
                        item.restaurantAddress ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                          color: AppColors.gray3,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
