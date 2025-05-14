import 'package:eto_ride/app/data/provider/passenger_socket.dart';
import 'package:eto_ride/app/modules/auth/cubit/google_auth_cubit.dart';
import 'package:eto_ride/app/modules/shell/view/shell_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'app/core/themes/app_theme_controller.dart';
import 'app/data/provider/passenger/passenger_websocket_manager.dart';
import 'app/modules/auth/cubit/complete_detail_cubit.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  // Ensure proper Flutter initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();
  print("Firebase connected");

  // Initialize Hive
  await Hive.initFlutter();
  var settingsBox = await Hive.openBox<bool>('settingsBox');
  settingsBox.put("get_start", false);

  // Initialize GetStorage
  await GetStorage.init();

  // Initialize PassengerSocket (optional)
  PassengerSocket().selectDriver("driver id");

  PassengerWebsocketManager().startService();

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize theme controller
    final themeController = Get.put(ThemeController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeController.theme, // Use theme from controller
      initialRoute: AppRoutes.SPLASH, // Set initial route
      getPages: AppPages.pages, // Define app pages
    );
  }
}
