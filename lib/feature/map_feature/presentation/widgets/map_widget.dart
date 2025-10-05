import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:task1/feature/map_feature/presentation/manager/map_page_controller.dart';

class MapWidget extends GetView<MapPageController> {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlutterMap(
        mapController: controller.mapController,
        options: MapOptions(
          initialCenter: LatLng(51.5, -0.09),
          initialZoom: 13,
          onTap: (tapPos, point) => controller.onMapTapped(point),
        ),
        children: [
          TileLayer(
            urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", //OSM map
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.map_sample_app',
          ),
          MarkerLayer(
            markers: [
              _currentLocation(),
              if (controller.startPoint.value != null) _source(),
              if (controller.endPoint.value != null) _destination(),
            ],
          ),
          if (controller.routePoints.isNotEmpty) _route(),
        ],
      ),
    );
  }

  PolylineLayer<Object> _route() {
    return PolylineLayer(
      polylines: [
        Polyline(
          points: controller.routePoints,
          strokeWidth: 4,
          color: Colors.blue,
        ),
      ],
    );
  }

  Marker _destination() {
    return Marker(
      point: controller.endPoint.value!,
      width: 70,
      height: 70,
      child: const Icon(Icons.location_on_rounded, color: Colors.black87),
    );
  }

  Marker _source() {
    return Marker(
      point: controller.startPoint.value!,
      width: 70,
      height: 70,
      child: const Icon(Icons.location_history, color: Colors.black),
    );
  }

  Marker _currentLocation() {
    return Marker(
      width: 80,
      height: 80,
      point: controller.currentLocation.value ?? LatLng(51.5, -0.09),
      child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
    );
  }
}
