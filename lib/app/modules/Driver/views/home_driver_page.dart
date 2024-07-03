import 'package:flutter/material.dart';

import '../../../core/components/components.dart';
import '../widgets/home_header.dart';
import '../widgets/shipping_list.dart';

class HomeDriverPage extends StatelessWidget {
  const HomeDriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          RestoHeader(),
          SpaceHeight(50.0),
          ShippingList(),
          SpaceHeight(30.0),
        ],
      ),
    );
  }
}
