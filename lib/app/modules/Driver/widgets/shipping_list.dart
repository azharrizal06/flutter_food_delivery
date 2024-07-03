import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/Driver/views/take_delivery_page.dart';

import '../../../core/core.dart';
import '../models/order_list_model.dart';

class ShippingList extends StatelessWidget {
  const ShippingList({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      OrderListModel(
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/11/29/12/54/cafe-1869656_1280.jpg',
        restoName: 'Bahri Coffehouse',
        customerName: 'Ojan',
        deliveryAddress: 'Jalan Kampung Flutter No 20',
        price: 32000,
        createdAt: DateTime.now().subtract(const Duration(seconds: 13)),
      ),
      OrderListModel(
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/11/29/12/54/cafe-1869656_1280.jpg',
        restoName: 'Bahri Coffehouse',
        customerName: 'Oman',
        deliveryAddress: 'Jalan Kampung Flutter No 20',
        price: 132000,
        createdAt: DateTime.now().subtract(const Duration(seconds: 13)),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Daftar Pengiriman',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray4,
                  ),
                ),
              ),
            ],
          ),
          if (products.isEmpty) ...[
            const SpaceHeight(100.0),
            Center(
              child: Assets.images.noDeliveryYet.image(
                height: 140.0,
              ),
            ),
            const SpaceHeight(60.0),
            const Center(
              child: Text(
                'Belum data Pengiriman',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ] else ...[
            const SpaceHeight(14.0),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              separatorBuilder: (context, index) => const SpaceHeight(11.0),
              itemBuilder: (context, index) => ShippingCard(
                item: products[index],
              ),
            ),
          ]
        ],
      ),
    );
  }
}

class ShippingCard extends StatelessWidget {
  final OrderListModel item;
  const ShippingCard({super.key, required this.item});

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
              imageUrl: item.imageUrl,
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
              Text(
                item.restoName,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SpaceHeight(4.0),
              SizedBox(
                width: context.deviceWidth - 182.0,
                child: Text(
                  'Pelanggan : ${item.customerName}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray2,
                  ),
                ),
              ),
              SizedBox(
                width: context.deviceWidth - 182.0,
                child: Text(
                  'Delivery Address : ${item.deliveryAddress}',
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
                    width: context.deviceWidth - 295.0,
                    child: Text(
                      item.priceFormatted,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(16.0),
                    onTap: () {
                      context.push(const TakeDeliveryPage());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: const Text(
                        'Take Delivery',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
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
