import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/driver_model.dart';

class DriverStorage {
  final String driverKey = "current_driver";

  /// Update and save the current driver
  Future<void> updateAndSaveDriver(Driver driver) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String driverJson = jsonEncode(driver.toJson());
    await prefs.setString(driverKey, driverJson);
  }

  /// Get the current driver
  Future<Driver?> getCurrentDriver() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? driverJson = prefs.getString(driverKey);

    if (driverJson != null) {
      final Map<String, dynamic> driverMap = jsonDecode(driverJson);
      return Driver.fromJson(driverMap);
    }

    return null; // No driver saved
  }

  /// Clear the saved driver
  Future<void> clearDriver() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(driverKey);
  }
}
