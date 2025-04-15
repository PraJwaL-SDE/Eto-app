// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Servicemodel {
  String vehicleType;
  DateTime time;
  int seats;
  double? initialPrice; // Made nullable
  double finalPrice;

  Servicemodel({
    required this.vehicleType,
    required this.time,
    required this.seats,
    this.initialPrice, // Nullable initialPrice
    required this.finalPrice,
  });

  Servicemodel copyWith({
    String? vehicleType,
    DateTime? time,
    int? seats,
    double? initialPrice,
    double? finalPrice,
  }) {
    return Servicemodel(
      vehicleType: vehicleType ?? this.vehicleType,
      time: time ?? this.time,
      seats: seats ?? this.seats,
      initialPrice: initialPrice ?? this.initialPrice,
      finalPrice: finalPrice ?? this.finalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vehicleType': vehicleType,
      'time': time.millisecondsSinceEpoch,
      'seats': seats,
      'initialPrice': initialPrice, // Nullable field
      'finalPrice': finalPrice,
    };
  }

  factory Servicemodel.fromMap(Map<String, dynamic> map) {
    return Servicemodel(
      vehicleType: map['vehicleType'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      seats: map['seats'] as int,
      initialPrice: map['initialPrice'] != null ? map['initialPrice'] as double : null, // Handle null case
      finalPrice: map['finalPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Servicemodel.fromJson(String source) =>
      Servicemodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Servicemodel(vehicleType: $vehicleType, time: $time, seats: $seats, initialPrice: $initialPrice, finalPrice: $finalPrice)';
  }

  @override
  bool operator ==(covariant Servicemodel other) {
    if (identical(this, other)) return true;

    return other.vehicleType == vehicleType &&
        other.time == time &&
        other.seats == seats &&
        other.initialPrice == initialPrice &&
        other.finalPrice == finalPrice;
  }

  @override
  int get hashCode {
    return vehicleType.hashCode ^
    time.hashCode ^
    seats.hashCode ^
    initialPrice.hashCode ^
    finalPrice.hashCode;
  }
}
