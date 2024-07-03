import 'package:get/get.dart';

import '../controllers/splas_controller.dart';

class SplasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplasController>(
      () => SplasController(),
    );
  }
}
