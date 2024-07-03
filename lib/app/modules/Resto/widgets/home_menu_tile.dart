import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class HomeMenuTile extends StatelessWidget {
  final String label;
  final String info;
  final String iconSvgPath;
  final Color color;
  final VoidCallback onPressed;

  const HomeMenuTile({
    super.key,
    required this.label,
    required this.info,
    required this.iconSvgPath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(iconSvgPath, height: 26.0),
            const SpaceHeight(15.0),
            SizedBox(
              height: 60.0,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
              ),
            ),
            Text(
              info,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: AppColors.gray6,
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
