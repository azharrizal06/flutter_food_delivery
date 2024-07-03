import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models/menu_model.dart';


class FormMenuBottomSheet extends StatefulWidget {
  final MenuModel? item;
  const FormMenuBottomSheet({super.key, this.item});

  @override
  State<FormMenuBottomSheet> createState() => _FormMenuBottomSheetState();
}

class _FormMenuBottomSheetState extends State<FormMenuBottomSheet> {
  late final TextEditingController nameController;
  late final TextEditingController priceController;
  late final TextEditingController stockController;
  late final TextEditingController imageController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.item?.name);
    priceController =
        TextEditingController(text: '${widget.item?.price ?? ''}');
    stockController =
        TextEditingController(text: '${widget.item?.stock ?? ''}');
    imageController = TextEditingController(text: widget.item?.imageUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: nameController,
            label: 'Nama Menu',
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(18.0),
          CustomTextField(
            controller: priceController,
            label: 'Harga ',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(18.0),
          CustomTextField(
            controller: stockController,
            label: 'Stok',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(18.0),
          CustomImagePicker(
            label: 'Foto Menu',
            imageUrl: widget.item?.imageUrl,
            onChanged: (imagePath) {
              imageController.text = imagePath ?? '';
            },
          ),
          const SpaceHeight(35.0),
          Button.filled(
            onPressed: () {
              if (nameController.text.isEmpty ||
                  priceController.text.isEmpty ||
                  stockController.text.isEmpty ||
                  imageController.text.isEmpty) {
                context.showDialogError(
                    'Failed', 'Terdapat inputan yang masih kosong');
              } else {
                context.pop();
                if (widget.item != null) {
                  context.showDialogSuccess('Sukses Edit Menu',
                      'Menu kamu dapat di lihat di daftar menu, dan akan ditampilkan di halaman menu pembeli');
                } else {
                  context.showDialogSuccess('Sukses Tambah Menu',
                      'Menu kamu dapat di lihat di daftar menu, dan akan ditampilkan di halaman menu pembeli');
                }
              }
            },
            label: 'Simpan',
          ),
        ],
      ),
    );
  }
}
