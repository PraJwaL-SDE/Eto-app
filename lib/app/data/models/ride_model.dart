import 'package:eto_ride/app/data/models/location_model.dart';

class RideModel {
  String id;
  LocationModel start;
  LocationModel destination;
  double fare;
  String passengerId;
  int seatCount;
  String driverId;
  bool luggage;
  double distance;
  double travelDistance;
  String? passengerSocketId; // Nullable field for passenger socket ID
  String? passengerName; // Nullable field for passenger name
  String? passengerProfilePic; // Nullable field for passenger profile picture

  RideModel({
    required this.id,
    required this.start,
    required this.destination,
    required this.fare,
    required this.passengerId,
    required this.seatCount,
    required this.driverId,
    required this.luggage,
    required this.distance,
    required this.travelDistance,
    this.passengerSocketId,
    this.passengerName,
    this.passengerProfilePic,
  });

  factory RideModel.fromJson(Map<String, dynamic> json) {
    double parseToDouble(dynamic value) {
      if (value is int) return value.toDouble();
      if (value is double) return value;
      return 0.0; // or throw an error, depending on your needs
    }

    return RideModel(
      id: json['id'] != null ? json['id'] as String : "null",
      start: LocationModel(
        latitude: parseToDouble(json['start_lat']) ?? 0.0,
        longitude: parseToDouble(json['start_long']) ?? 0.0,
        name: (json['start_address'] as String?) ?? "null",
      ),
      destination: LocationModel(
        latitude: parseToDouble(json['des_lat']) ?? 0.0,
        longitude: parseToDouble(json['des_long']) ?? 0.0,
        name: (json['des_address'] as String?) ?? "null",
      ),
      fare: parseToDouble(json['fare']) ?? 0.0,
      passengerId: (json['passenger_id'] as String?) ?? "null",
      seatCount: (json['seat_count'] as int?) ?? 0,
      driverId: (json['driver_id'] as String?) ?? "null",
      luggage: (json['luggage'] as bool?) ?? false,
      distance: parseToDouble(json['distance']) ?? 0.0,
      travelDistance: parseToDouble(json['travel_distance']) ?? 0.0,
      passengerSocketId: (json['passenger_socket_id'] as String?) ?? "null",
      passengerName: (json['passenger_name'] as String?) ?? "null",
      passengerProfilePic: (json['passenger_profile_pic'] as String?) ?? "null",
    );

  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'start_lat': start.latitude,
      'start_long': start.longitude,
      'start_address': start.name,
      'des_lat': destination.latitude,
      'des_long': destination.longitude,
      'des_address': destination.name,
      'fare': fare,
      'passenger_id': passengerId,
      'seat_count': seatCount,
      'driver_id': driverId,
      'luggage': luggage,
      'distance': distance,
      'travel_distance': travelDistance,
      // 'passenger_socket_id': passengerSocketId,
      'passenger_name': passengerName,
      'passenger_profile_pic': passengerProfilePic,
    };
  }
}
