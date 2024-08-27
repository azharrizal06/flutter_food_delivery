import 'package:flutter/material.dart';
import 'package:food_delivery/app/core/components/spaces.dart';
import 'package:food_delivery/app/modules/home/widgets/profile_header.dart';
import 'package:get/get.dart';

import '../../../DataRespon/Respon_login.dart';
import '../../../core/constants/colors.dart';
import '../controllers/home_controller.dart';
import '../widgets/card_edit_profil.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final HomeController homeController = Get.put(HomeController());

  late ResponDataLogin user = ResponDataLogin();
  void initState() {
    super.initState();
    // controllerresto.getData();
    homeController.getData()
      ?..then((value) {
        setState(() {
          user = value.value;
        });
      });
    print("coba user profile");
    print(user.data?.user?.photo);
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    var tinggi_appbar = AppBar().preferredSize.height;
    var tinggi_bottom = MediaQuery.of(context).viewInsets.bottom;
    var tinggi_boddy = tinggi - tinggi_appbar - tinggi_bottom;

    return Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            Column(
              children: [
                const ProfileHeader(
                  gambar:
                      "https://nationaltoday.com/wp-content/uploads/2022/10/456840829-min-1200x834.jpg",
                ),
                const SpaceHeight(20.0),
                cardedit(
                  lebar: lebar,
                  Nama: "Nama",
                  data: "${user.data?.user?.name}",
                  Edit: "Edit",
                ),
                cardedit(
                  lebar: lebar,
                  Nama: "Email",
                  data: "${user.data?.user?.email}",
                  Edit: "Edit",
                ),
                cardedit(
                  lebar: lebar,
                  Nama: "Nomer",
                  data: "${user.data?.user?.phone}",
                ),
              ],
            ),
            // IconButton(
            //     onPressed: () {
            //       Get.back();
            //     },
            //     icon: Icon(Icons.arrow_back)),
            Column(
              children: [
                SpaceHeight(tinggi_boddy / 9),
                const Align(
                  alignment: Alignment.center,
                  child: const Text(
                    "Edit Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        )
      ]),
    ));
  }
}
