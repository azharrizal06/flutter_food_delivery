import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/core/components/custom_text_field.dart';
import 'package:food_delivery/app/core/components/spaces.dart';
import 'package:food_delivery/app/core/extensions/extensions.dart';
import 'package:food_delivery/app/modules/Resto/controllers/resto_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../help/appColors.dart';
import '../models/menu_model.dart';

class RegisterResto extends StatefulWidget {
  final MenuModel? item;
  const RegisterResto({super.key, this.item});

  @override
  State<RegisterResto> createState() => _RegisterRestoState();
}

class _RegisterRestoState extends State<RegisterResto> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var controller = Get.put(RestoController());
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);

        print(_image!.path);
      });
    }
  }

//delete image
  void deleteImage() {
    setState(() {
      _image = null;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 30.0),
                  margin: const EdgeInsets.only(top: 50.0),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(28.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SpaceHeight(28.0),
                      CustomTextField(
                        controller: emailController,
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: AppColors.primary,
                        ),
                      ),
                      const SpaceHeight(14.0),
                      CustomTextField(
                        controller: phoneController,
                        label: 'Handphone',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: AppColors.primary,
                        ),
                      ),
                      const SpaceHeight(14.0),
                      CustomTextField(
                        controller: nameController,
                        label: 'Name',
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: AppColors.primary,
                        ),
                      ),
                      const SpaceHeight(18.0),
                      CustomTextField(
                        controller: passwordController,
                        label: 'Password',
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(
                          Icons.key,
                          color: AppColors.primary,
                        ),
                      ),
                      const SpaceHeight(18.0),
                      if (_image != null) ...[
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(12.0),
                              width: 65.0,
                              height: 65.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.stroke),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(_image!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => deleteImage(),
                              icon: const Icon(Icons.cancel),
                            ),
                          ],
                        ),
                      ] else ...[
                        InkWell(
                          onTap: () => _pickImage(),
                          child: Assets.images.imagePlaceholder
                              .image(height: 65.0),
                        )
                      ],
                      const SpaceHeight(33.0),
                      Button.filled(
                        onPressed: () {
                          controller.registerResto(
                              nameController.text,
                              emailController.text,
                              phoneController.text,
                              passwordController.text,
                              // latlong
                              _image!);
                        },
                        label: 'Sign Up',
                      ),
                      const SpaceHeight(16.0),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'Sudah memiliki akun? ',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: AppColors.gray3,
                            ),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: const TextStyle(
                                  color: AppColors.primary,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.pop(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipOval(
                    child: ColoredBox(
                      color: AppColors.gray5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Assets.images.logo.image(
                          height: 100.0,
                          width: 100.0,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
