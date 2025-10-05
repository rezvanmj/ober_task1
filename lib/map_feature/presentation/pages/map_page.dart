import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../manager/map_page_controller.dart';

class MapPage extends GetView<MapPageController> {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                _map(),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child:
                      (controller.endPoint.value != null &&
                          controller.startPoint.value != null)
                      ? _distance(context)
                      : _selectLocationButton(),
                ),
                _currentLocationButton(),
              ],
            ),
          ),
          // floatingActionButton:,
        ),
      ),
    );
  }

  Align _currentLocationButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          mini: true,
          backgroundColor: Colors.lightGreen,
          onPressed: controller.determinePosition,
          child: const Icon(Icons.gps_fixed_outlined, color: Colors.white),
        ),
      ),
    );
  }

  FilledButton _selectLocationButton() {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        if (controller.startPoint.value == null &&
            controller.endPoint.value == null) {
          controller.startSelectingPoints();
        } else {}
      },
      child: controller.startPoint.value == null
          ? Text('Select Source')
          : (controller.endPoint.value == null &&
                controller.startPoint.value != null)
          ? Text('Select Destination')
          : SizedBox(),
    );
  }

  Widget _distance(BuildContext context) {
    return Obx(() {
      final distance = controller.getDistanceInKm();
      if (distance == null) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _tripDetail(distance),
          const SizedBox(height: 10),
          _button(context),
        ],
      );
    });
  }

  Widget _button(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              showDialog(
                context: Get.context ?? context,
                builder: (context) => AlertDialog(
                  title: const Text('Request Trip'),
                  content: const Text('Trip accepted successfully'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        controller.startSelectingPoints();
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Request Trip'),
          ),
        ),
      ],
    );
  }

  Widget _tripDetail(double distance) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Distance:${distance.toStringAsFixed(2)}Km',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Fare: ${gidistance.toInt()} €',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Obx _map() {
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
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.map_sample_app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80,
                height: 80,
                point: controller.currentLocation.value ?? LatLng(51.5, -0.09),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              if (controller.startPoint.value != null)
                Marker(
                  point: controller.startPoint.value!,
                  width: 50,
                  height: 50,
                  child: const Icon(Icons.flag, color: Colors.green),
                ),
              if (controller.endPoint.value != null)
                Marker(
                  point: controller.endPoint.value!,
                  width: 50,
                  height: 50,
                  child: const Icon(Icons.flag, color: Colors.blue),
                ),
            ],
          ),
          if (controller.routePoints.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: controller.routePoints,
                  strokeWidth: 4,
                  color: Colors.blue,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
