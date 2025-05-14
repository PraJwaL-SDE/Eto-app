import 'package:eto_ride/app/data/storage/passenger_storage.dart';
import 'package:eto_ride/app/data/storage/setting_storage.dart';
import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/enums/user_type.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initializeApp();
    });
  }

  /// Initialize app settings and navigate to the appropriate screen
  Future<void> _initializeApp() async {
    try {
      final settings = await SettingStorage().loadSettings();

      if (settings == null) {
        // Navigate to select language if settings are not configured
        Get.offAndToNamed(AppRoutes.SELECT_LANGUAGE);
        return;
      }

      if (settings.userType == UserType.PASSENGER) {
        final user = await PassengerStorage().getCurrentPassenger();
        if (user == null) {
          // Navigate to login if user is not found
          Get.offAndToNamed(AppRoutes.ENTER_MOBILE);
        } else {
          // Navigate to the main app shell
          Get.offAndToNamed(AppRoutes.SHELL, arguments: {
            'userType': UserType.PASSENGER,
            'user': user,
          });
        }
      } else {
        // Handle other user types (e.g., drivers) if required
        print("User type not handled: ${settings.userType}");
        Get.offAndToNamed(AppRoutes.SELECT_LANGUAGE);
      }
    } catch (e) {
      // Handle any errors during initialization
      print("Error during initialization: $e");
      Get.offAndToNamed(AppRoutes.SELECT_LANGUAGE);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.cover, // Makes the image fill the screen
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
