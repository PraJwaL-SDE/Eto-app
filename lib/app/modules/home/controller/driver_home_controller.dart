import 'dart:ui';

import 'package:eto_ride/app/core/services/location_service.dart';
import 'package:eto_ride/app/data/models/ride_model.dart';
import 'package:eto_ride/app/data/provider/driver_provider.dart';
import 'package:eto_ride/app/data/provider/driver_socket.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/models/driver_model.dart';

class DriverHomeController extends GetxController {
  late GoogleMapController mapController;
  var center = const LatLng(45.521563, -122.677433).obs; // Observable center
  var markers = <Marker>[].obs; // Observable markers
  var showRideRequest = true.obs;
  var showRideRequestExpanded = false.obs;
  var showDriverStatus = true.obs;
  var showAcceptedWidgets = false.obs;
  var showVerifyOtpWidgets = false.obs;
  var showOtpBoxes = false.obs;
  var showRideComplete = false.obs;
  var showTripStarted = false.obs;
  var isOnline = false.obs;
  late Driver driver;
  late DriverSocket driverSocket;
  RxList<RideModel> rides = <RideModel>[].obs;
  late RideModel selectedRide;
  var isOptVerifying = false.obs;


  final otpFields = List<String>.generate(4, (_) => "").obs;

  void setOtpValue(int index, String value) {
    otpFields[index] = value;
    update();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void resetAllWidgets() {
    showRideRequest.value = false;
    showRideRequestExpanded.value = false;
    showDriverStatus.value = false;
    showAcceptedWidgets.value = false;
    showVerifyOtpWidgets.value = false;
    showOtpBoxes.value = false;
    showRideComplete.value = false;
    showTripStarted.value = false;
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
    checkDriverOnline();
  }

  void checkDriverOnline() async {
    isOnline.value = await DriverProvider().checkAvailability(driver.id);
    if (isOnline.value) {
      listenWebSocket();
    }
  }

  void updateDriverOnline(bool value) async {
    final currentLocation = await LocationService.getCurrentLocation();
    final success = await DriverProvider().changeAvailability(
        status: value, driver_id: driver.id, location: currentLocation);
    if (success) isOnline.value = value;

    if (isOnline.value) {
      listenWebSocket();
    } else {
      if (driverSocket != null) driverSocket.stopListeningToDriver();
    }
  }

  void listenWebSocket() async {
    driverSocket = DriverSocket();
    driverSocket.sendMessage('new-connection', {'driver_id': driver.id});
    rides.value = await DriverProvider().getDriverRideRequest(driver.id);
  }

  void driverRiderResponse(RideModel ride) async {
    resetAllWidgets();
    showVerifyOtpWidgets.value = true;
    driverSocket.sendMessage('accept-ride-request', {
      'driver_id': driver.id,
      'receiver': ride.passengerSocketId,
      'status': "ACCEPT"
    });
  }

  void verifyOtp(String otp) async {
    isOptVerifying.value = true;
    final result =
        await DriverProvider().verifyRideOtp(selectedRide.id, int.parse(otp));
    isOptVerifying.value = false;
    if (result) {
      resetAllWidgets();
      showTripStarted.value = true;
    }
  }

  void endRide() {}
}
