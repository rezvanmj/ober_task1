import 'dart:convert';

import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

import '../../../../core/constants/app_enum.dart';

class MapPageController extends GetxController {
  final mapController = MapController();

  var currentLocation = Rxn<LatLng>();
  var startPoint = Rxn<LatLng>();
  var endPoint = Rxn<LatLng>();
  RxString sourceAddress = ''.obs;
  RxString destinationAddress = ''.obs;
  var routePoints = <LatLng>[].obs;
  var selectMode = SelectMode.selectingStart.obs;
  final Distance _distance = Distance();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    determinePosition();
  }

  double? getDistanceInKm() {
    if (startPoint.value == null || endPoint.value == null) return null;
    return _distance.as(
      LengthUnit.Kilometer,
      startPoint.value!,
      endPoint.value!,
    );
  }

  void startSelectingPoints() {
    startPoint.value = null;
    endPoint.value = null;
    routePoints.clear();
    selectMode.value = SelectMode.selectingStart;
  }

  Future<void> onMapTapped(LatLng tappedPoint) async {
    if (selectMode.value == SelectMode.selectingStart) {
      startPoint.value = tappedPoint;
      selectMode.value = SelectMode.selectingEnd;
    } else if (selectMode.value == SelectMode.selectingEnd) {
      endPoint.value = tappedPoint;
      selectMode.value = SelectMode.none;
      await getRoute();
    }
  }

  Future<void> determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition();
    final currentLatLng = LatLng(position.latitude, position.longitude);

    currentLocation.value = currentLatLng;
    mapController.move(currentLatLng, 15);
  }

  // i could use DIO package for API service and DARTZ and EQUITABLE packages for error handling
  Future<void> getRoute() async {
    if (startPoint.value != null && endPoint.value != null) {
      final url =
          'https://router.project-osrm.org/route/v1/driving/${startPoint.value?.longitude},${startPoint.value?.latitude};${endPoint.value?.longitude},${endPoint.value?.latitude}?overview=full&geometries=geojson';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final cords = data['routes'][0]['geometry']['coordinates'] as List;
        routePoints.value = cords
            .map((c) => LatLng(c[1].toDouble(), c[0].toDouble()))
            .toList();
      }
    }
  }

  Future<void> getAddresses() async {
    isLoading.value = true;
    sourceAddress.value =
        await getAddressFromLatLng(startPoint.value ?? LatLng(0.0, 0.0)) ?? '';
    destinationAddress.value =
        await getAddressFromLatLng(endPoint.value ?? LatLng(0.0, 0.0)) ?? '';
    isLoading.value = false;
  }

  // i could use DIO package for API service and DARTZ and EQUITABLE packages for error handling
  Future<String?> getAddressFromLatLng(LatLng point) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?lat=${point.latitude}&lon=${point.longitude}&format=json';

    final response = await http.get(
      Uri.parse(url),
      headers: {"User-Agent": "flutter_map_app"},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['display_name'];
    }
    return null;
  }
}
