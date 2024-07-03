import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/core.dart';

class TakeDeliveryPage extends StatefulWidget {
  const TakeDeliveryPage({super.key});

  @override
  State<TakeDeliveryPage> createState() => _TakeDeliveryPageState();
}

class _TakeDeliveryPageState extends State<TakeDeliveryPage> {
  final ruminateCoffe = const LatLng(-7.749868618509824, 110.3735274153414);
  late GoogleMapController mapController;

  Marker marker = const Marker(
    markerId: MarkerId('marker_1'),
    position: LatLng(-7.749868618509824, 110.3735274153414),
    infoWindow: InfoWindow(
        title: 'RUMINATE Coffee & Roastery',
        snippet:
            'Jl. Lempongsari Raya No.111, Sumberan, Sariharjo, Kec. Ngaglik, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55581'),
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: ruminateCoffe,
                zoom: 15.0,
              ),
              markers: {marker},
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 38.0, 0, 0),
            child: IconButton(
              onPressed: () => context.pop(),
              icon: Assets.icons.backButton.svg(),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
        child: ColoredBox(
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SpaceHeight(6.0),
                Container(
                  width: context.deviceWidth,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: AppColors.background,
                  ),
                  child: const Text(
                    'Your Trip is already on this way to you!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SpaceHeight(27.0),
                Row(
                  children: [
                    SizedBox(
                      width: (context.deviceWidth / 2) - 14.0,
                      child: Row(
                        children: [
                          Assets.icons.locationCircle.svg(),
                          const SpaceWidth(12.0),
                          SizedBox(
                            width: context.deviceWidth - 280,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery Address',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.gray2,
                                  ),
                                ),
                                SpaceHeight(8.0),
                                Text(
                                  'JL. Kampung Flutter No. 20',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: (context.deviceWidth / 2) - 14.0,
                      child: Row(
                        children: [
                          Assets.icons.distanceCircle.svg(),
                          const SpaceWidth(12.0),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Distance',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.gray2,
                                ),
                              ),
                              SpaceHeight(8.0),
                              Text(
                                '1.2 Km',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(30.0),
                Row(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://storage.googleapis.com/cdn.vcgamers.com/news/wp-content/uploads/2023/11/Screenshot-1545.png',
                        height: 44.0,
                        width: 44.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SpaceWidth(15.0),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Syafa Rina',
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          '+62 856 492 444',
                          style: TextStyle(
                            color: AppColors.gray2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SpaceHeight(30.0),
                Button.filled(
                  onPressed: () {
                    context.pop();
                  },
                  label: 'Pesanan Selesai',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
