import 'package:flutter/material.dart';

import '../../../core/components/components.dart';
import '../widgets/choose_menu.dart';
import '../widgets/resto_header.dart';

class RestoMenuPage extends StatelessWidget {
  const RestoMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          RestoHeader(),
          SpaceHeight(30.0),
          ChooseMenu(),
          SpaceHeight(30.0),
        ],
      ),
    );
  }
}
