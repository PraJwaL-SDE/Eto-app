import 'dart:convert';
import 'dart:io';

import 'package:eto_ride/app/core/utils/api_config.dart';
import 'package:http/http.dart' as http;

import '../models/location_model.dart';
class RideProvider{
  Future<Map<String, dynamic>> getAvailableRides(LocationModel start, LocationModel destination) async {
    try {
      var response = await http.post(
        Uri.parse(ApiConfig.availableRides),
        headers: {"Content-Type": "application/json"}, // Set headers if needed
        body: jsonEncode({
          "origin": {"lat": start.latitude, "lang": start.longitude},
          "destination": {"lat": destination.latitude, "lang": destination.longitude},
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception("Failed to fetch available rides. Status code: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet connection. Please check your network.");
    } on FormatException {
      throw Exception("Invalid response format. Unable to parse data.");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

}