import 'dart:convert'; // For JSON decoding

import 'package:eto_ride/app/core/utils/api_config.dart';
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
}
