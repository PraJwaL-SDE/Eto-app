import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controller/home_controller.dart'; // Import your HomeController

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: controller.onMapCreated, // Use controller's method
              initialCameraPosition: CameraPosition(
                target: controller.center.value, // Use controller's observable
                zoom: 11.0,
              ),
              markers: controller.markers.toSet(), // Use controller's markers
            ),

          ],
        ),
      ),
    );
  }
}