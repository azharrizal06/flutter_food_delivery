import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/core.dart';
import '../controllers/resto_controller.dart';
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
  TextEditingController descriptionController = TextEditingController();

  XFile? image;
  bool is_available = false;
  bool is_favorite = false;
  final resto_controller = Get.put(RestoController());

  @override
  void initState() {
    nameController = TextEditingController(text: widget.item?.name);
    priceController =
        TextEditingController(text: '${widget.item?.price ?? ''}');
    stockController =
        TextEditingController(text: '${widget.item?.stock ?? ''}');

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
            label: 'Nama produk',
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(18.0),
          CustomTextField(
            controller: descriptionController,
            label: 'description produk',
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(18.0),
          CustomTextField(
            controller: priceController,
            label: 'Harga produk',
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
            label: 'Foto Produk',
            imageUrl: widget.item?.imageUrl,
            onChanged: (imagePath) {
              image = imagePath;
            },
          ),
          const SpaceHeight(35.0),
          Row(
            children: [
              Checkbox(
                  activeColor: AppColors.primary,
                  value: is_available,
                  onChanged: (value) {
                    setState(() {
                      is_available = value!;
                    });
                  }),
              const Text('Tersedia'),
              const SpaceWidth(20.0),
              Checkbox(
                  activeColor: AppColors.primary,
                  value: is_favorite,
                  onChanged: (value) {
                    setState(() {
                      is_favorite = value!;
                    });
                  }),
              const Text('Favorit'),
            ],
          ),
          const SpaceHeight(35.0),
          Button.filled(
            onPressed: () async {
              if (nameController.text.isEmpty ||
                  priceController.text.isEmpty ||
                  stockController.text.isEmpty ||
                  descriptionController.text.isEmpty ||
                  image == null) {
                context.showDialogError(
                    'Failed', 'Terdapat inputan yang masih kosong');
              } else {
                await resto_controller.addproduk(
                    nameController.text,
                    descriptionController.text,
                    priceController.text,
                    stockController.text,
                    is_available ? true : false,
                    is_favorite ? true : false,
                    image!);
                resto_controller.getproduk();
              }
            },
            label: 'Simpan',
          ),
        ],
      ),
    );
  }
}
