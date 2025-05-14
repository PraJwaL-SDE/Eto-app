import 'package:eto_ride/app/core/utils/enums/user_type.dart';

class SettingsModel {
  bool getStartedComplete;
  String language;
  UserType userType;
  String theme;

  SettingsModel({
    this.getStartedComplete = false,
    this.language = 'en', // Default to English
    required this.userType,
    this.theme = 'light', // Default to light theme
  });

  /// Factory constructor to create an instance from a Map (e.g., JSON)
  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      getStartedComplete: json['getStartedComplete'] ?? false,
      language: json['language'] ?? 'en',
      userType: UserType.values.firstWhere(
            (e) => e.toString() == json['userType'],
        orElse: () => UserType.PASSENGER, // Default value
      ),
      theme: json['theme'] ?? 'light',
    );
  }

  /// Method to convert the instance to a Map (e.g., for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'getStartedComplete': getStartedComplete,
      'language': language,
      'userType': userType.toString(),
      'theme': theme,
    };
  }
}
