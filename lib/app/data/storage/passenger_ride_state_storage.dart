import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/enums/passenger_ride_state.dart';

class PassengerRideStateStorage{
  final String _key = "ride_state";
  Future<void> setRideState(PassengerRideState state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, state.index); // Store the index
  }

  Future<PassengerRideState?> getRideState() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_key);

    if (index != null && index >= 0 && index < PassengerRideState.values.length) {
      return PassengerRideState.values[index]; // Convert index to enum
    }
    return null; // Return null if no valid state is found
  }

  Future<void> clearRideState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

}