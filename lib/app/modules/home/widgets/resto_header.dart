import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class RestoHeader extends StatelessWidget {
  const RestoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const ClipPath(
          clipper: CustomClip(),
          child: ColoredBox(
            color: AppColors.primary,
            child: SizedBox(
              height: 250.0,
              width: double.infinity,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          padding: const EdgeInsets.fromLTRB(20.0, 36.0, 20.0, 20.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 20.0,
                spreadRadius: 0,
                color: AppColors.black.withOpacity(0.2),
                blurStyle: BlurStyle.outer,
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2016/11/18/14/05/brick-wall-1834784_1280.jpg',
                      fit: BoxFit.cover,
                      width: 56.0,
                      height: 56.0,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  const SpaceWidth(12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CWB Resto',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SpaceHeight(4.0),
                      Row(
                        children: [
                          Assets.icons.location.svg(),
                          const SpaceWidth(8.0),
                          const Text(
                            'Yogyakarta',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SpaceHeight(20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.yellow,
                            ),
                            Text(
                              '4.9',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SpaceWidth(4.0),
                        Text(
                          '190+ ratings',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray2,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          10000.currencyFormatRp,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          'Delivery Fee',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray2,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  const CustomClip();

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClip oldClipper) {
    return false;
  }
}
