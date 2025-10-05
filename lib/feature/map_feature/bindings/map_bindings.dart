import 'package:get/get.dart';

import '../presentation/manager/map_page_controller.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapPageController());
  }
}
