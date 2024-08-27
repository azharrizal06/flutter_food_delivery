import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/core.dart';
import '../controllers/home_controller.dart';

class ChangeAddressPage extends StatefulWidget {
  const ChangeAddressPage({super.key});

  @override
  State<ChangeAddressPage> createState() => _ChangeAddressPageState();
}

class _ChangeAddressPageState extends State<ChangeAddressPage> {
  final HomeController homeController = Get.find<HomeController>();
  late final TextEditingController addressController;
  late GoogleMapController mapController;
  double? latitude;
  double? longitude;
  String? deliveryAddress;
  LatLng? selectedLocation;

  Future<void> getCurrentPosition() async {
    try {
      Location location = Location();

      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      locationData = await location.getLocation();
      latitude = locationData.latitude;
      longitude = locationData.longitude;

      if (latitude != null && longitude != null) {
        await getAddressFromLatLng(latitude!, longitude!);
      }

      setState(() {});
    } on PlatformException catch (e) {
      if (e.code == 'IO_ERROR') {
        debugPrint(
            'A network error occurred trying to lookup the supplied coordinates: ${e.message}');
      } else {
        debugPrint('Failed to lookup coordinates: ${e.message}');
      }
    } catch (e) {
      debugPrint('An unknown error occurred: $e');
    }
  }

  Future<void> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<geo.Placemark> placemarks =
          await geo.placemarkFromCoordinates(lat, lng);
      geo.Placemark place = placemarks[0];
      deliveryAddress =
          "${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}";
      addressController.text = deliveryAddress!;
    } catch (e) {
      debugPrint('Failed to get address: $e');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onTap(LatLng position) async {
    setState(() {
      selectedLocation = position;
      latitude = position.latitude;
      longitude = position.longitude;
    });
    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        position.latitude, position.longitude);
    geo.Placemark place = placemarks[0];
    if (placemarks.isNotEmpty) {
      setState(() {
        deliveryAddress =
            "${place.name}, ${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
        addressController.text = deliveryAddress!;
      });
    }
  }

  @override
  void initState() {
    addressController = TextEditingController();
    getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LatLng center = LatLng(latitude ?? 0, longitude ?? 0);
    Marker marker = Marker(
      markerId: const MarkerId('marker_1'),
      position: LatLng(latitude ?? 0, longitude ?? 0),
      draggable: true,
      onDragEnd: (newPosition) {
        // _onTap(newPosition);
      },
    );
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: latitude == null
                ? const Padding(
                    padding: EdgeInsets.only(top: 70.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  )
                : GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: center,
                      zoom: 18.0,
                    ),
                    markers: selectedLocation != null
                        ? {
                            Marker(
                              markerId: const MarkerId("selected_location"),
                              position: selectedLocation!,
                            ),
                          }
                        : {marker},
                    onTap: _onTap,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 38.0, 0, 0),
            child: IconButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                var data = pref.getString("auth_data");
                print(data);
                // Get.back();
                // context.pop();
                // context.read<GetUserBloc>().add(const GetUserEvent.getUser());
              },
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
                const SpaceHeight(15.0),
                const Text(
                  "Pilih Lokasi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SpaceHeight(22.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SpaceWidth(10.0),
                    Assets.icons.locationCircle.svg(),
                    const SpaceWidth(10.0),
                    Flexible(
                      child: Text(
                        deliveryAddress ?? '',
                        maxLines: 3,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray3,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(18.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomTextField(
                    controller: addressController,
                    label: 'Enter address detail',
                    showLabel: false,
                    textInputAction: TextInputAction.done,
                    // maxLines: 4,
                  ),
                ),
                const SpaceHeight(22.0),
                Button.filled(
                    onPressed: () {
                      print("Latitude: $latitude");
                      print("Longitude: $longitude");
                      print("Address: $deliveryAddress");
                      homeController.updateLatLong(
                          latitude!, longitude!, addressController.text);
                    },
                    label: 'Ubah Alamat',
                    height: 50.0,
                    width: 300.0,
                    fontSize: 18.0,
                    borderRadius: 32.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
