import 'package:eto_ride/models/ServiceModel.dart';
import 'package:eto_ride/screens/bottom_nav/home_screen.dart';
import 'package:latlong2/latlong.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
class ServiceData{

  Future<List<Servicemodel>> getRecommondedPassengerList(LatLng start,LatLng destination) async{
    return [
      Servicemodel(
        vehicleType: "Eto Rickshaw",
        time: DateTime.now().subtract(const Duration(minutes: 2)),
        seats: 3,
        initialPrice: 30.00,
        finalPrice: 22.00,
      ),
      Servicemodel(
        vehicleType: "Eto Rickshaw",
        time: DateTime.now().subtract(const Duration(minutes: 6)),
        seats: 5,

        finalPrice: 22.00,
      ),
      Servicemodel(
        vehicleType: "Eto Rickshaw",
        time: DateTime.now().subtract(const Duration(minutes: 2)),
        seats: 3,

        finalPrice: 22.00,
      ),

    ];
  }
}
