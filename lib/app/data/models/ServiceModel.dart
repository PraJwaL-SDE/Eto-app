import 'dart:convert';

import 'package:eto_ride/app/data/models/location_model.dart';

class Servicemodel {
  String vehicleType;
  DateTime time;
  int seats;
  double? initialPrice; // Nullable initialPrice
  double finalPrice;
  String driverId;
  double distanceToDriver;
  LocationModel driverPosition;
  String driverSocketId;


  Servicemodel({
    required this.vehicleType,
    required this.time,
    required this.seats,
    this.initialPrice,
    required this.finalPrice,
    required this.driverId,
    required this.distanceToDriver,
    required this.driverPosition,
    required this.driverSocketId,
  });

  Servicemodel copyWith({
    String? vehicleType,
    DateTime? time,
    int? seats,
    double? initialPrice,
    double? finalPrice,
    String? driverId,
    double? distanceToDriver,
    LocationModel? driverPosition,
    String? driverSocketId,
  }) {
    return Servicemodel(
      vehicleType: vehicleType ?? this.vehicleType,
      time: time ?? this.time,
      seats: seats ?? this.seats,
      initialPrice: initialPrice ?? this.initialPrice,
      finalPrice: finalPrice ?? this.finalPrice,
      driverId: driverId ?? this.driverId,
      distanceToDriver: distanceToDriver ?? this.distanceToDriver,
      driverPosition: driverPosition ?? this.driverPosition,
      driverSocketId: driverSocketId ?? this.driverSocketId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vehicleType': vehicleType,
      'time': time.millisecondsSinceEpoch,
      'seats': seats,
      'initialPrice': initialPrice,
      'finalPrice': finalPrice,
      'driverId': driverId,
      'distanceToDriver': distanceToDriver,
      'driverPosition': driverPosition.toJson(),
      'driverSocketId': driverSocketId,
    };
  }

  factory Servicemodel.fromMap(Map<String, dynamic> map) {
    return Servicemodel(
      vehicleType: map['vehicleType'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      seats: map['seats'] as int,
      initialPrice: map['initialPrice'] != null ? map['initialPrice'] as double : null,
      finalPrice: map['finalPrice'] as double,
      driverId: map['driverId'] as String,
      distanceToDriver: map['distanceToDriver'] as double,
      driverPosition: LocationModel.fromJson(map['driverPosition'] as Map<String, dynamic>),
      driverSocketId: map['driverSocketId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Servicemodel.fromJson(String source) =>
      Servicemodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Servicemodel(vehicleType: $vehicleType, time: $time, seats: $seats, initialPrice: $initialPrice, finalPrice: $finalPrice, driverId: $driverId, distanceToDriver: $distanceToDriver, driverPosition: $driverPosition, driverSocketId: $driverSocketId)';
  }

  @override
  bool operator ==(covariant Servicemodel other) {
    if (identical(this, other)) return true;

    return other.vehicleType == vehicleType &&
        other.time == time &&
        other.seats == seats &&
        other.initialPrice == initialPrice &&
        other.finalPrice == finalPrice &&
        other.driverId == driverId &&
        other.distanceToDriver == distanceToDriver &&
        other.driverPosition == driverPosition &&
        other.driverSocketId == driverSocketId;
  }

  @override
  int get hashCode {
    return vehicleType.hashCode ^
    time.hashCode ^
    seats.hashCode ^
    initialPrice.hashCode ^
    finalPrice.hashCode ^
    driverId.hashCode ^
    distanceToDriver.hashCode ^
    driverPosition.hashCode ^
    driverSocketId.hashCode;
  }
}
