import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  late GoogleMapController mapController;
  var center = const LatLng(45.521563, -122.677433).obs; // Observable center
  var markers = <Marker>[].obs; // Observable markers

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void onInit() {
    super.onInit();
    // Example marker
    markers.add(Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(45.521563, -122.677433),
      infoWindow: InfoWindow(title: 'My Location'),
    ));
    // Add more markers as needed.
  }

// Add methods to update center, markers, etc.
}