import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../DataRespon/Respon_login.dart';
import '../../../core/core.dart';
import '../../home/widgets/profile_header.dart';
import '../controllers/resto_controller.dart';

class ProfileRestoPage extends StatefulWidget {
  ProfileRestoPage({super.key});

  @override
  State<ProfileRestoPage> createState() => _ProfileRestoPageState();
}

class _ProfileRestoPageState extends State<ProfileRestoPage> {
  // final HomeController homeController = Get.put(HomeController());
  final RestoController controllerresto = Get.put(RestoController());
  late ResponDataLogin data;
  @override
  void initState() {
    super.initState();
    // controllerresto.getData();
    controllerresto.getData()
      ?..then((value) {
        setState(() {
          data = value.value;
        });
      });
    print("coba data profile");

    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProfileHeader(gambar: data.data?.user!.photo ?? ""),
          const SpaceHeight(10.0),
          Text(
            "${data.data?.user?.name ?? ""} ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          Text(
            '${data.data?.user?.email ?? ""} | ${data.data?.user?.phone ?? ""}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          const SpaceHeight(30.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: AppColors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: Assets.icons.myAccountCircle.svg(),
                    title: const Text('My Account'),
                    subtitle: const Text('Make changes to your account'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Assets.icons.logoutCircle.svg(),
                    title: const Text('Log out'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      controllerresto.logout();
                    },
                  ),
                  ListTile(
                    leading: Assets.icons.helpAndSupportCircle.svg(),
                    title: const Text('Help & Support'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Assets.icons.aboutAppCircle.svg(),
                    title: const Text('About App'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          const SpaceHeight(30.0),
        ],
      ),
    );
  }
}
