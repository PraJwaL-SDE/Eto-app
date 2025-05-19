import 'dart:convert';

import 'package:eto_ride/app/core/utils/private_keys.dart';
import 'package:eto_ride/app/data/models/ServiceModel.dart';
import 'package:eto_ride/app/data/models/location_model.dart';
import 'package:eto_ride/app/data/models/passenger_model.dart';
import 'package:eto_ride/app/data/models/ride_model.dart';
import 'package:eto_ride/app/data/provider/passenger/passenger_websocket_manager.dart';
import 'package:eto_ride/app/data/provider/passenger_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../core/services/location_service.dart';

class HomeController extends GetxController {
  // late GoogleMapController mapController;
  var center = const LatLng(45.521563, -122.677433).obs; // Observable center
  var markers = <Marker>[].obs; // Observable markers
  var searchLocations = <LocationModel>[].obs;
  var showSearchLocation = false.obs;
  var updatingPickup = false.obs;
  var updatingDrop = false.obs;
  var showServiceList = false.obs;
  var showSearchingLoading = false.obs;
  var showPickupDrop = true.obs;
  var showDriverDetail = false.obs;
  var showTripDetail = false.obs;
  var isLocationLoading = false.obs;
  late Passenger passenger;
  final PassengerWebsocketManager passengerWebsocketManager = PassengerWebsocketManager();
  late double travelDistance = 0;

  Rx<LocationModel> start =
      LocationModel(latitude: 0, longitude: 0, name: '').obs;
  Rx<LocationModel> destination =
      LocationModel(latitude: 0, longitude: 0, name: '').obs;

  TextEditingController pickupTextEditingController = TextEditingController();
  TextEditingController dropoffTextEditingController = TextEditingController();

  late Servicemodel selectedService ;
  void collapseAll() {
    showSearchLocation.value = false;
    updatingPickup.value = false;
    updatingDrop.value = false;
    showServiceList.value = false;
    showSearchingLoading.value = false;
    showPickupDrop.value = false;
    showDriverDetail.value = false;
    showTripDetail.value = false;
  }

  late GoogleMapsPlaces _places;

  HomeController() {
    _places =
        GoogleMapsPlaces(apiKey: PrivateKeys.googleMapApiKey);
  }

  void searchLocation(String query) async {
    if (query.isEmpty) return;

    try {
      // Fetch autocomplete results
      final response = await _places.autocomplete(query);
      print("Autocomplete Response: ${response.toJson()}");

      if (response.isOkay) {
        searchLocations.clear(); // Clear previous search results

        for (var prediction in response.predictions) {
          print("Processing Prediction: ${prediction.description}");

          // Fetch place details for latitude and longitude
          final detailsResponse =
              await _places.getDetailsByPlaceId(prediction.placeId!);
          print("Details Response: ${detailsResponse.toJson()}");

          if (detailsResponse.isOkay) {
            final location = detailsResponse.result.geometry?.location;
            if (location != null) {
              print("Location: lat=${location.lat}, lng=${location.lng}");
              searchLocations.add(
                LocationModel(
                  latitude: location.lat,
                  longitude: location.lng,
                  name: prediction.description ?? 'Unknown Location',
                  address: prediction.description ?? '',
                ),
              );
            } else {
              print(
                  "Location data missing in Details Response for ${prediction.description}");
            }
          } else {
            print("Failed to fetch details for ${prediction.placeId}");
          }
        }
      } else {
        print("Autocomplete Response not OK: ${response.status}");
      }
    } catch (e) {
      print("Error searching location: $e");
    }
  }

  void _initServices() async {
    isLocationLoading.value = true;

    start.value = await LocationService.getCurrentLocation();
    destination.value = LocationModel(
        latitude: start.value.latitude,
        longitude: start.value.longitude,
        name: "select location");
    // controller.destination.value.name = "Select location";
    isLocationLoading.value = false;


    await passengerWebsocketManager.startService();
    print("web socket start service");

  }

  void onMapCreated(GoogleMapController controller) {
    // mapController = controller;
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
    checkForUpdates();
    _initServices();
  }

  void checkForUpdates() async {}

  void storeState() {}
  void selectService(Servicemodel serviceModel) async{
    print("service selected " + serviceModel.toJson());
    selectedService = serviceModel;
    RideModel ride = RideModel(
      id: Uuid().v4(),
      start: start.value,
      destination: destination.value,
      fare: selectedService!.finalPrice,
      passengerId: passenger.id,
      seatCount: selectedService!.seats,
      driverId: selectedService!.driverId,
      luggage: true,
      distance: selectedService!.distanceToDriver,
      travelDistance: travelDistance,
    );
    await PassengerProvider().addRideRequest(ride);


    passengerWebsocketManager.sendMessage('select-driver', {
      "receiver": selectedService!.driverSocketId,
      "driver_id": selectedService!.driverId,
      "ride":
        ride.toJson(),

    });
    print("message send to socket");
    collapseAll();
    showDriverDetail.value = true;
  }

  void startRide() {}

  void completeRide() {}
}
