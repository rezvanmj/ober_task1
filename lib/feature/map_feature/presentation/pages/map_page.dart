import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/app_space.dart';
import '../manager/map_page_controller.dart';
import '../widgets/map_widget.dart';

class MapPage extends GetView<MapPageController> {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Scaffold(
          body: Stack(
            children: [
              MapWidget(),
              _selectButton(context),
              _currentLocationButton(context),
            ],
          ),
          // floatingActionButton:,
        ),
      ),
    );
  }

  Widget _selectButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child:
          (controller.endPoint.value != null &&
              controller.startPoint.value != null)
          ? _distance(context)
          : SafeArea(child: _selectLocationButton(context)),
    );
  }

  Align _currentLocationButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: FloatingActionButton(
            mini: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: controller.determinePosition,
            child: Icon(
              Icons.gps_fixed_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectLocationButton(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
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

      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _tripDetail(distance, context),
            AppSpace(height: 10),
            _button(context),
          ],
        ),
      );
    });
  }

  Widget _button(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IgnorePointer(
            ignoring: controller.isLoading.value,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                await _showAddresses(context);
              },
              child: controller.isLoading.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Request Trip'),
                        AppSpace(width: 5),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ],
                    )
                  : Text('Request Trip'),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showAddresses(BuildContext context) async {
    await controller.getAddresses().then((value) {
      showDialog(
        context: Get.context ?? context,
        builder: (context) => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Trip Requested Successfully',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                AppSpace(height: 40),
                Wrap(
                  children: [
                    Text(
                      'Source Address : ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(controller.sourceAddress.value),
                  ],
                ),

                AppSpace(height: 20),
                Wrap(
                  children: [
                    Text(
                      'Destination Address : ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(controller.destinationAddress.value),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      controller.startSelectingPoints();
                    },
                    child: Text('OK'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _tripDetail(double distance, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
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
            'Fare: ${distance.toInt()} €',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
