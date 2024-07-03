import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splas_controller.dart';

class SplasView extends GetView<SplasController> {
  const SplasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplasView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SplasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
