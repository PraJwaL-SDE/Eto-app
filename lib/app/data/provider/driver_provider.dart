import 'dart:convert'; // For JSON decoding

import 'package:eto_ride/app/core/utils/api_config.dart';
import '../models/driver_model.dart';
import 'package:http/http.dart' as http;

class DriverProvider {
  static Future<bool> updateDriverData(Driver driver) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.driverUpdate),
        body: driver.toJson(),
      );

      // Check if the status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Return whether the 'success' key in the response is true
        return responseData['success'] == true;
      } else {
        // Handle response errors
        throw Exception('Failed to update driver data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any exceptions (network, json parsing, etc.)
      print('Error: $error');
      return false;
    }
  }
}
