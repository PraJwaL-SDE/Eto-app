class LocationModel {
  double latitude; // Corrected spelling
  double longitude;
  String name;
  String address;

  LocationModel({
    required this.latitude,
    required this.longitude,
    required this.name,
     this.address = '',
  });

  /// Convert LocationModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'name': name,
      'address': address,
    };
  }

  /// Create LocationModel from JSON
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
      name: json['name'],
      address: json['address'],
    );
  }
}
