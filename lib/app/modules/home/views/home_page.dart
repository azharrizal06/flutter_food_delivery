import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/home/widgets/loading.dart';
import 'package:get/get.dart';

import '../../../DataRespon/respon_restoran.dart';
import '../../../core/assets/assets.dart';
import '../../../core/components/components.dart';
import '../../../core/constants/colors.dart';
import '../controllers/home_controller.dart';
import '../widgets/resto_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final images = [
    Assets.images.banner.path,
    Assets.images.banner.path,
    Assets.images.banner.path,
    Assets.images.banner.path,
  ];
  int _currentIndex = 0;

  void initState() {
    super.initState();
    homeController.getData();
  }

  final HomeController homeController = Get.put(HomeController());
  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(24.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                    Obx(
                      () => Text(
                        '${homeController.DataUser.value.data?.user?.name}',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: Assets.icons.notificationCircle.svg(),
                // ),
                IconButton(
                    onPressed: () async {
                      homeController.logout();
                    },
                    icon: Icon(Icons.logout)),
              ],
            ),
            const SpaceHeight(10.0),
            CustomTextField(
              controller: searchController,
              label: 'Cari resto di sini',
              showLabel: false,
              borderRadius: 32.0,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.search.svg(),
              ),
            ),
            const SpaceHeight(40.0),
            StatefulBuilder(
              builder: (context, setIndexCarousel) => Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 150.0,
                        autoPlay: true,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setIndexCarousel(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: images.map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {},
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                  height: 150.0,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.asMap().entries.map((entry) {
                      return Container(
                        width: 70.0,
                        height: 4.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          color: _currentIndex == entry.key
                              ? AppColors.white
                              : AppColors.gray1,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SpaceHeight(20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Rekomendasi Resto',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray4,
                    ),
                  ),
                ),
              ],
            ),
            const SpaceHeight(10.0),
            FutureBuilder<List<DataResto>?>(
                future: homeController.getAllRestaurant(),
                builder: (context, snp) {
                  if (snp.connectionState == ConnectionState.waiting) {
                    return loading(context);
                  }
                  print("snp.data?.length");
                  print(snp.data?.length);
                  if (snp.data == null || snp.data!.isEmpty) {
                    return const Center(child: Text("Data Kosong"));
                  }
                  print(snp.data?.length);
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 26.0,
                      ),
                      itemCount: snp.data?.length,
                      // itemCount: 4,
                      itemBuilder: (context, index) {
                        DataResto userData = snp.data![index];
                        print(
                            'Index: $index, Restaurant Name: ${userData.restaurantName}');

                        return RestoCard(
                          item: userData,
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }
}
