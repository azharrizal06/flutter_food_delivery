import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class cardedit extends StatelessWidget {
  const cardedit({
    super.key,
    required this.lebar,
    required this.Nama,
    required this.data,
    this.Edit,
  });

  final double lebar;
  final String Nama;
  final String data;
  final String? Edit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 4),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.gray5.withOpacity(0.5),
      ),
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: lebar,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$Nama"),
                  Text("$data"),
                ],
              ),
            ),
            Edit == null
                ? Container()
                : TextButton(onPressed: () {}, child: Text("$Edit"))
          ],
        ),
      ),
    );
  }
}
