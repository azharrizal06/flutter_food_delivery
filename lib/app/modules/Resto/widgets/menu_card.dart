import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controllers/resto_controller.dart';
import '../models/menu_model.dart';
import 'form_menu_bottom_sheet.dart';

class MenuCard extends StatelessWidget {
  final MenuModel item;
  final int id;
  MenuCard({super.key, required this.item, required this.id});

  final resto_controller = Get.put(RestoController());
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
                item.name,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SpaceHeight(4.0),
              Text(
                'Stok: ${item.stock}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray2,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: context.deviceWidth - 285.0,
                    child: Text(
                      item.priceFormatted,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Hapus Menu Ini ?',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SpaceHeight(16.0),
                                const Text(
                                  'Apakah Anda yakin ingin menghapus menu ini?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.gray1,
                                  ),
                                ),
                                const SpaceHeight(30.0),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Button.filled(
                                        onPressed: () => context.pop(),
                                        label: 'Batalkan',
                                        color: AppColors.red,
                                      ),
                                    ),
                                    const SpaceWidth(40.0),
                                    Flexible(
                                      child: Button.filled(
                                        onPressed: () async {
                                          print(id);
                                          await resto_controller
                                              .deleteProduk(id);
                                          resto_controller.getproduk();
                                          context.pop();
                                          context.showDialogSuccess(
                                              'Sukses Hapus Menu',
                                              'Menu kamu telah dihapus di daftar menu, dan akan dihilangkan di halaman menu pembeli');
                                        },
                                        label: 'Hapus',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Assets.icons.delete.svg(),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        builder: (context) => FormMenuBottomSheet(
                          item: item,
                        ),
                      );
                    },
                    icon: Assets.icons.edit.svg(),
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
