import 'dart:convert'; // For JSON decoding

import 'package:eto_ride/app/core/utils/api_config.dart';
import 'package:eto_ride/app/data/models/ride_model.dart';
import '../models/passenger_model.dart'; // Assuming you have a Passenger model
import 'package:http/http.dart' as http;

class PassengerProvider {
  static Future<dynamic> updatePassengerData(Passenger passenger) async {
    try {
      print("updating passenger ${passenger.toString()}" );
      final data = jsonEncode({
        'id': passenger.id,
        'email': passenger.email,
        'first_name': passenger.firstName,
        'last_name': passenger.lastName,
      });
      final response = await http.post(
        Uri.parse(ApiConfig.passengerUpdate),
        body: data,
        headers: {
          'Content-Type': 'application/json'
        }
      );
      print(response.body);

      // Check if the status code is 200 (OK)
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the JSON response
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Return whether the 'success' key in the response is true
        print(responseData);
        return responseData;
      } else {
        // Handle response errors
        throw Exception('Failed to update passenger data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any exceptions (network, json parsing, etc.)
      print('Error: $error');
      return false;
    }
  }

  Future<int> getRideOtp(String ride_id) async {
    try {
      // Make the HTTP GET request
      final response = await http.get(Uri.parse(ApiConfig.getRideOtp + "?ride_id=$ride_id"));

      // Check for successful response
      if (response.statusCode == 200) {
        // Parse the response body
        final responseData = json.decode(response.body);
        // Extract the OTP value
        if (responseData != null && responseData['otp'] != null) {
          return responseData['otp'];
        } else {
          throw Exception("OTP not found in response");
        }
      } else {
        throw Exception("Failed to fetch OTP: ${response.statusCode}");
      }
    } catch (e) {
      // Handle errors
      throw Exception("Error getting ride OTP: $e");
    }
  }

  Future<bool> addRideRequest(RideModel ride) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.addRideRequest),
        headers: {
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: jsonEncode({
          "ride": ride.toJson(), // Serialize the ride model
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Ride request added successfully: ${response.body}");
        return true;
      } else {
        print(
            "Failed to add ride request. Status code: ${response.statusCode}, Response: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error adding ride request: $e");
      return false;
    }
  }

}
