import 'package:shared_preferences/shared_preferences.dart';
import 'package:eto_ride/app/data/models/ServiceModel.dart';

class PassengerRideStorage {
  final String _key = "passenger_current_ride";

  /// Store a `Servicemodel` object in SharedPreferences
  Future<void> setService(Servicemodel servicemodel) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = servicemodel.toJson(); // Convert object to JSON string
    await prefs.setString(_key, jsonString); // Store the JSON string
  }

  /// Retrieve a `Servicemodel` object from SharedPreferences
  Future<Servicemodel?> getService() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key); // Retrieve the JSON string

    if (jsonString != null) {
      return Servicemodel.fromJson(jsonString); // Convert JSON string back to object
    }
    return null; // Return null if no data is found
  }

  /// Clear the stored service
  Future<void> clearService() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key); // Remove the stored value
  }
}
