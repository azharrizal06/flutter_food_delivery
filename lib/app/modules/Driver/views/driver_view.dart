import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/spaces.dart';
import '../../home/widgets/resto_header.dart';
import '../controllers/driver_controller.dart';
import '../widgets/shipping_list.dart';

class DriverView extends GetView<DriverController> {
  const DriverView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DriverView'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            RestoHeader(),
            SpaceHeight(50.0),
            ShippingList(),
            SpaceHeight(30.0),
          ],
        ));
  }
}
