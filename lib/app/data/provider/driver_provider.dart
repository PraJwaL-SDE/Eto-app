import 'dart:convert'; // For JSON decoding

import 'package:eto_ride/app/core/utils/api_config.dart';
import 'package:eto_ride/app/data/models/ride_model.dart';
import '../models/driver_model.dart';
import 'package:http/http.dart' as http;

import '../models/location_model.dart';

class DriverProvider {
  static Future<bool> updateDriverData(Driver driver) async {
    try {
      print(driver.toJson());
      final response = await http.post(
        Uri.parse(ApiConfig.driverUpdate),
        body: jsonEncode(driver.toJson()),
        headers: {
          "Content-Type": "application/json",
        },
      );

      // Check if the status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the JSON response
        print(response.body);
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Return whether the 'success' key in the response is true
        return responseData['success'] == true ||
            responseData['driver'] != null;
      } else {
        // Handle response errors
        throw Exception('Failed to update driver data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any exceptions (network, json parsing, etc.)
      print('Error while updating driver: $error');
      return false;
    }
  }

  Future<bool> changeAvailability({
    required bool status,
    required String driver_id,
    required LocationModel location,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.changeDriverAvailable),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {
            'status': status,
            'driver_id': driver_id,
            'latitude': location.latitude,
            'longitude': location.longitude,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Availability changed successfully');
        return true;
      } else {
        print(('Failed to change availability: ${response.body}'));

      }

    } catch (e) {
      print('Error changing availability: $e');
    }
    return false;
  }

  Future<bool> checkAvailability(String driver_id) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.checkDriverAvailable}?driver_id=$driver_id'),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return body['status'] as bool;
      } else {
        throw Exception('Failed to check availability: ${response.body}');
      }
    } catch (e) {
      print('Error checking availability: $e');
      return false;
    }
  }

  Future<List<RideModel>> getDriverRideRequest(String driverId) async {
    final response = await http.get(
      Uri.parse('${ApiConfig.getDriverRideRequest}?driver_id=$driverId'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
      if (responseData['success'] == true) {
        final List<dynamic> ridesList = responseData['rides'];
        return ridesList.map((rideJson) {
          return RideModel.fromJson(rideJson as Map<String, dynamic>);
        }).toList();
      } else {
        throw Exception('Failed to fetch rides: ${responseData['message']}');
      }
    } else {
      throw Exception('Failed to fetch rides. Status code: ${response.statusCode}');
    }
  }

  Future<bool> verifyRideOtp(String ride_id, int otp) async {
    try {
      // Create JSON body
      final body = json.encode({
        "ride_id": ride_id,
        "otp": otp, // Keep as int
      });

      // Make the HTTP POST request
      final response = await http.post(
        Uri.parse(ApiConfig.verifyRideOtp),
        headers: {
          "Content-Type": "application/json", // Specify JSON content type
        },
        body: body,
      );

      // Check for successful response
      if (response.statusCode == 200) {
        // Parse the response body
        final responseData = json.decode(response.body);
        // Return success status
        if (responseData != null && responseData['success'] != null) {
          return responseData['success'];
        } else {
          throw Exception("Success status not found in response");
        }
      } else {
        throw Exception("Failed to verify OTP: ${response.statusCode}");
      }
    } catch (e) {
      // Handle errors
      throw Exception("Error verifying ride OTP: $e");
    }
  }




}
