import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/core.dart';
import '../models/track_record_model.dart';
import '../widgets/tracking_vertical.dart';
import 'order_complete_page.dart';

class OrderStatusAfterPayment extends StatefulWidget {
  const OrderStatusAfterPayment({super.key});

  @override
  State<OrderStatusAfterPayment> createState() =>
      _OrderStatusAfterPaymentState();
}

class _OrderStatusAfterPaymentState extends State<OrderStatusAfterPayment> {
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
      floatingActionButton: GestureDetector(
        onVerticalDragStart: (details) => showModalBottomSheet(
          context: context,
          isScrollControlled: false, // TODO: do true when order is delivering
          useSafeArea: true,
          // showDragHandle: true,
          backgroundColor: AppColors.white,
          builder: (context) => const OrderStatusBottomSheet(),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
          child: ColoredBox(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 48.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      child: Divider(
                        color: AppColors.gray2,
                        thickness: 4.0,
                      ),
                    ),
                  ),
                  const SpaceHeight(17.0),
                  Row(
                    children: [
                      const SpaceWidth(10.0),
                      Assets.images.orderStatus.processing.image(height: 44.0),
                      const SpaceWidth(10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Processing your order ...',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SpaceWidth(4.0),
                          Text(
                            'The restaurant is preparing your food',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SpaceHeight(24.0),
                  Row(
                    children: [
                      const SpaceWidth(10.0),
                      Assets.images.orderStatus.preparing.image(height: 44.0),
                      const SpaceWidth(10.0),
                      const Text(
                        'Preparing your order',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(24.0),
                  Row(
                    children: [
                      const SpaceWidth(10.0),
                      Assets.images.orderStatus.delivering.image(height: 44.0),
                      const SpaceWidth(10.0),
                      const Text(
                        'Delivering your order',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderStatusBottomSheet extends StatelessWidget {
  const OrderStatusBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final trackRecords = [
      TrackRecordModel(
        label: 'Restaurant location',
        title: 'Starbucks',
        isDelivery: true,
        updatedAt: DateTime.now().subtract(const Duration(minutes: 23)),
        address: 'Jalan Kampung Flutter No. 20',
      ),
      TrackRecordModel(
        label: 'Delivery location',
        title: 'Kampung Flutter',
        isDelivery: false,
        updatedAt: DateTime.now().subtract(const Duration(minutes: 67)),
      ),
      TrackRecordModel(
        label: 'Delivery location',
        title: 'Kampung Flutter',
        isDelivery: false,
        updatedAt: DateTime.now(),
      ),
      TrackRecordModel(
        label: 'Restaurant location',
        title: 'Starbucks',
        isDelivery: true,
        updatedAt: DateTime.now().subtract(const Duration(minutes: 203)),
        address: 'Jalan Kampung Flutter No. 20',
      ),
      TrackRecordModel(
        label: 'Delivery location',
        title: 'Kampung Flutter',
        isDelivery: false,
        updatedAt: DateTime.now().subtract(const Duration(minutes: 607)),
      ),
      TrackRecordModel(
        label: 'Delivery location',
        title: 'Kampung Flutter',
        isDelivery: false,
        updatedAt: DateTime.now().subtract(const Duration(minutes: 6017)),
      ),
    ];
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Row(
          children: [
            const SpaceWidth(10.0),
            Assets.images.orderStatus.processing.image(height: 44.0),
            const SpaceWidth(10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Processing your order ...',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SpaceWidth(4.0),
                Text(
                  'The restaurant is preparing your food',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray3,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SpaceHeight(24.0),
        Row(
          children: [
            const SpaceWidth(10.0),
            Assets.images.orderStatus.preparing.image(height: 44.0),
            const SpaceWidth(10.0),
            const Text(
              'Preparing your order',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SpaceHeight(24.0),
        Row(
          children: [
            const SpaceWidth(10.0),
            Assets.images.orderStatus.delivering.image(height: 44.0),
            const SpaceWidth(10.0),
            const Text(
              'Delivering your order',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SpaceHeight(27.0),
        // TODO: when order is processing
        Button.outlined(
          disabled: false, // TODO: disabled true when order is preparing
          onPressed: () {},
          label: 'Batalkan Pesanan',
          textColor: AppColors.red,
        ),
        // TODO: remove this when integration api *************
        const SpaceHeight(16.0),
        Button.filled(
          onPressed: () => context.push(const OrderCompletePage()),
          label: 'Menyelesaikan Pesanan',
        ),
        // *************
        // TODO: when order is delivering
        // ignore: dead_code
        if (false) ...[
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: AppColors.stroke),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'AB 1234 CD',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(16.0),
                const DottedDivider(
                  color: AppColors.gray3,
                  dashWidth: 4,
                ),
                const SpaceHeight(16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fauzan Abdillah',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SpaceHeight(4.0),
                        Text(
                          '082123456789',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://img.quizur.com/f/img6509fbbcaea825.02664697.jpeg?lastEdited=1695153096',
                        fit: BoxFit.cover,
                        width: 56.0,
                        height: 56.0,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SpaceHeight(24.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: AppColors.stroke),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delivery details',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(16.0),
                const DottedDivider(
                  color: AppColors.gray3,
                  dashWidth: 4,
                ),
                const SpaceHeight(16.0),
                TrackignVertical(trackRecords: trackRecords),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
