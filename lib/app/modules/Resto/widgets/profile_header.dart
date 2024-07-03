import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: ClipPath(
            clipper: CustomClip(),
            child: ColoredBox(
              color: AppColors.primary,
              child: SizedBox(
                height: 250.0,
                width: double.infinity,
              ),
            ),
          ),
        ),
        ClipOval(
          child: CachedNetworkImage(
            imageUrl:
                'https://cdn.pixabay.com/photo/2016/11/18/14/05/brick-wall-1834784_1280.jpg',
            fit: BoxFit.cover,
            width: 110.0,
            height: 110.0,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: IconButton(
            onPressed: () {},
            icon: Assets.icons.editCircle.svg(),
            padding: EdgeInsets.zero,
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
