import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

Widget loading(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.grey.shade100,
    child: Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
    ),
  );
}
