import 'package:flutter/animation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../bindings/map_bindings.dart';
import '../presentation/pages/map_page.dart';

List<GetPage> mapRoutes = [
  GetPage(
    name: '/map',
    page: () => MapPage(),
    transitionDuration: const Duration(milliseconds: 1000),
    curve: Curves.fastOutSlowIn,
    transition: Transition.fade,
    binding: MapBindings(),
  ),
];
