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
                          'https://img.quizur.com/f/img6509fbbcaea825.02664697.jpeg?lastEdited=1695153096',
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
                        'Satria Ramadhan',
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
                            '085806396661',
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plat Nomor',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SpaceWidth(4.0),
                        Text(
                          'AB 1234 CD',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray2,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Pengantaran',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Belum ada Data',
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
