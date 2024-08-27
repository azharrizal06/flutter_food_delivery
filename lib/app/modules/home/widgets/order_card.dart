import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../help/Api.dart';
import '../controllers/home_controller.dart';
import '../models/restoproduk.dart';

class OrderCard extends StatefulWidget {
  final Restoproduk item;
  OrderCard({super.key, required this.item});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 8.0,
            spreadRadius: 0,
            color: AppColors.black.withOpacity(0.2),
            blurStyle: BlurStyle.outer,
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CachedNetworkImage(
              imageUrl: "$urlApi/uploads/${widget.item.imageUrl}",
              fit: BoxFit.cover,
              width: 90.0,
              height: 90.0,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ),
          const SpaceWidth(28.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.item.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      print("hapus");
                      homeController.removeProduct(widget.item);
                    }),
                    icon: Assets.icons.delete.svg(),
                  ),
                ],
              ),
              const SpaceHeight(4.0),
              SizedBox(
                width: context.deviceWidth - 182.0,
                child: Text(
                  widget.item.description,
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
                  SizedBox(
                    width: context.deviceWidth - 293.0,
                    child: Text(
                      widget.item.priceFormatted,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeController.kurangjumlah(widget.item);
                      setState(() {
                        // if (widget.item.quantity > 1) {
                        //   // widget.item.quantity--;

                        //   print(
                        //       "Decremented quantity for: ${widget.item.quantity}");
                        // }
                      });
                    },
                    icon: Assets.icons.reduceQuantity.svg(),
                  ),
                  SizedBox(
                    width: 18.0,
                    height: 18.0,
                    child: Center(
                      child: Text(
                        '${widget.item.quantity}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeController.tambahjumlah(widget.item);
                      setState(() {
                        // if (widget.item.quantity > 1) {
                        //   // widget.item.quantity++;

                        //   print(
                        //       "Decremented quantity for: ${widget.item.quantity}");
                        // }
                      });
                    },
                    icon: Assets.icons.addQuantity.svg(),
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
