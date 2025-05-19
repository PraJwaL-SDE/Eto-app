import 'package:eto_ride/app/data/models/location_model.dart';
import 'package:eto_ride/app/data/provider/ride_provider.dart';
import 'package:latlong2/latlong.dart';

import '../models/ServiceModel.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
class ServiceData {
  Future<List<Servicemodel>> getRecommondedPassengerList(
      LocationModel start, LocationModel destination) async {
    final res = await RideProvider().getAvailableRides(start, destination);
    print(res);

    final distance = res['tripDistance'];
    final nearestDrivers = res['nearestDrivers'] as List<dynamic>;
    List<Servicemodel> serviceList = [];

    for (var driver in nearestDrivers) {
      serviceList.add(
        Servicemodel(
          vehicleType: "Eto Rickshaw",
          time: DateTime.now().subtract(const Duration(minutes: 2)),
          seats: 3,
          finalPrice: driver['fare'],
          driverId: driver['driver_id'] ?? "null",
          driverPosition: LocationModel(latitude: driver['position']['latitude'], longitude: driver['position']['longitude'], name: 'name'),
          distanceToDriver: driver['distance'],
          driverSocketId: driver['socket_id'] ?? "null"
        )
      );
    }

    return serviceList;
  }
}