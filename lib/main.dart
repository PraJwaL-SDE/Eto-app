import 'package:eto_ride/app/modules/shell/view/shell_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'app/core/themes/app_theme_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';


void main() async{
  runApp(const MyApp());
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.white,
  //     statusBarIconBrightness: Brightness.dark,
  //   ),
  // );
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyC5jhKK0jB-wG0Cbxas0h0TsqxmtvfCynk",
      authDomain: "eto-ride-app.firebaseapp.com",
      projectId: "eto-ride-app",
      storageBucket: "eto-ride-app.firebasestorage.app",
      messagingSenderId: "636807459181",
      appId: "1:636807459181:web:a1570af850a35e407a2a64",
      measurementId: "G-JE0KPX4CWH",
    ),
  );
  await Hive.initFlutter();
  var getStartVal = await  Hive.openBox<bool>('settingsBox');
  getStartVal.put("get_start", false);
  print("Firebase connected");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController()); // Initialize theme controller

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeController.theme, // Use the theme from the controller
      initialRoute: AppRoutes.SHELL, // Set initial route
      getPages: AppPages.pages, // Use your app pages

    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get authServices => null;

  @override
  void initState() {
    super.initState();
    // Simulate initialization delay and navigate to the main screen

    Future.delayed(const Duration(seconds: 1), () async{
      // var user =  await authServices.signInWithGoogle();
      var user;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  ShellView(),
        ),
      );
    });
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
