import 'dart:convert'; // Required for jsonEncode and jsonDecode
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/enums/user_type.dart';
import '../models/settings_model.dart';

class SettingStorage {
  static const String _settingsKey = 'appSettings';

  /// Save the entire SettingsModel as a JSON string
  Future<void> saveSettings(SettingsModel settings) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(settings.toJson()); // Proper JSON encoding
    await prefs.setString(_settingsKey, jsonString);
  }

  /// Load SettingsModel from SharedPreferences
  Future<SettingsModel?> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_settingsKey);
    print(jsonString.runtimeType);

    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>; // Decode JSON string
      print(jsonMap.runtimeType);
      return SettingsModel.fromJson(jsonMap);
    }
    return null;
  }

  /// Clear all saved settings
  Future<void> clearSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_settingsKey);
  }

  /// Update the `getStartedComplete` parameter
  Future<void> updateGetStartedComplete(bool value) async {
    final settings = await loadSettings() ?? SettingsModel(userType: UserType.PASSENGER);
    settings.getStartedComplete = value;
    await saveSettings(settings);
  }

  /// Update the `language` parameter
  Future<void> updateLanguage(String language) async {
    final settings = await loadSettings() ?? SettingsModel(userType: UserType.PASSENGER);
    settings.language = language;
    await saveSettings(settings);
  }

  /// Update the `userType` parameter
  Future<void> updateUserType(UserType userType) async {
    final settings = await loadSettings() ?? SettingsModel(userType: UserType.PASSENGER);
    settings.userType = userType;
    await saveSettings(settings);
  }

  /// Update the `theme` parameter
  Future<void> updateTheme(String theme) async {
    final settings = await loadSettings() ?? SettingsModel(userType: UserType.PASSENGER);
    settings.theme = theme;
    await saveSettings(settings);
  }
}
