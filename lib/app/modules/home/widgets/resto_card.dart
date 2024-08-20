import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/help/Api.dart';

import '../../../core/core.dart';
import '../models/resto_model.dart';
import '../views/resto_menu_page.dart';

class RestoCard extends StatelessWidget {
  final RestoModel item;
  RestoCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(RestoMenuPage(
        item: item,
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
                imageUrl: "$urlApi/images/${item.imageUrl}",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          Column(
            children: [
              SpaceHeight(8.0),
              Text(
                item.restoName,
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
                      item.address,
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
          )
        ],
      ),
    );
  }
}
