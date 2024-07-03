import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../components/buttons.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/spaces.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../data/appColors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          SizedBox(
            height: 250.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Assets.images.logo.image(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(28.0)),
                child: ColoredBox(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        const SpaceHeight(8.0),
                        const Text(
                          'Masukkan Kredensial akun untuk melanjutkan  masuk dalam aplikasi',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: AppColors.gray3,
                          ),
                        ),
                        const SpaceHeight(14.0),
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
                        const SpaceHeight(18.0),
                        CustomTextField(
                          controller: passwordController,
                          label: 'Password',
                          obscureText: true,
                          prefixIcon: const Icon(
                            Icons.key,
                            color: AppColors.primary,
                          ),
                        ),
                        const SpaceHeight(33.0),
                        Obx(() {
                          if (controller.isLoading.value) {
                            return Align(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator());
                          }
                          return Button.filled(
                            onPressed: () async {
                              controller.login(emailController.text,
                                  passwordController.text);
                            },
                            label: 'Sign In',
                          );
                        }),
                        const SpaceHeight(16.0),
                        Button.filled(
                          onPressed: () {
                            Get.toNamed(Routes.RESTO);
                          },
                          label: 'Sign In as Resto',
                        ),
                        const SpaceHeight(16.0),
                        Button.filled(
                          onPressed: () {
                            Get.toNamed(Routes.DRIVER);
                          },
                          label: 'Sign In as Driver',
                        ),
                        const SpaceHeight(16.0),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: 'Belum memiliki akun? ',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: AppColors.gray3,
                              ),
                              children: [
                                TextSpan(
                                    text: 'Daftar',
                                    style: const TextStyle(
                                      color: AppColors.primary,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed(Routes.DAFTAR);
                                      }
                                    // context.push(const RegisterPage()),
                                    ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
