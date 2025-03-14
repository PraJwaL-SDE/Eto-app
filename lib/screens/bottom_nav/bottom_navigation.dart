import 'package:eto_ride/getx/bottom_nav_controller.dart';
import 'package:eto_ride/screens/bottom_nav/account_screen.dart';
import 'package:eto_ride/screens/bottom_nav/activity_screen.dart';
import 'package:eto_ride/screens/bottom_nav/home_screen.dart';
import 'package:eto_ride/screens/bottom_nav/services_screen.dart';
import 'package:eto_ride/utils/constant_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  final currentIdx;
  final User? firebaseUser;
  BottomNavigation({super.key, this.currentIdx = 0, required this.firebaseUser});

  final BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    bottomNavController.currentIdx.value = currentIdx;
    List<Widget> navigationScreens = [
      HomeScreen(),
      ServicesScreen(),
      ActivityScreen(),
      AccountScreen(firebaseUser: firebaseUser!,),
    ];

    return Scaffold(
      body: Obx(
            () => navigationScreens.elementAt(bottomNavController.currentIdx.value),
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: bottomNavController.currentIdx.value,
          onTap: (index) {
            bottomNavController.currentIdx.value = index;
          },
          selectedItemColor: ConstantColor.primary, // Color for selected tab
          unselectedItemColor: Colors.black,       // Color for unselected tabs
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.design_services),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
