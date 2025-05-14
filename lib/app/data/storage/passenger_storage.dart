import 'dart:convert'; // For encoding/decoding JSON
import 'package:shared_preferences/shared_preferences.dart';
import '../models/passenger_model.dart';

class PassengerStorage {
  // Key for storing the passenger data
  final String passengerKey = 'current_passenger';

  // Save or update the current passenger in storage
  Future<void> updateAndSaveCurrent(Passenger passenger) async {
    try {
      final jsonData = jsonEncode(passenger.toJson());
      print('Attempting to save data: $jsonData');
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(passengerKey, jsonData);
      print('Passenger data saved successfully.');
    } catch (e) {
      print('Failed to save passenger data: $e');
    }
  }

  // Retrieve the current passenger from storage
  Future<Passenger?> getCurrentPassenger() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonData = prefs.getString(passengerKey);
      print('Retrieved data: $jsonData');
      if (jsonData != null) {
        return Passenger.fromJson(jsonDecode(jsonData));
      }
    } catch (e) {
      print('Failed to retrieve passenger data: $e');
    }
    return null;
  }
}
