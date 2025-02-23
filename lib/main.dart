import 'package:eto_ride/screens/auth/enter_detail_screen.dart';
import 'package:eto_ride/screens/auth/enter_moble_screen.dart';
import 'package:eto_ride/screens/auth/verify_otp_screen.dart';
import 'package:eto_ride/screens/get_started/get_started_screen.dart';
import 'package:eto_ride/screens/get_started/select_language_screen.dart';
import 'package:eto_ride/screens/get_started/user_type_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Baloo_2",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EnterMobleScreen()
    );
  }
}

