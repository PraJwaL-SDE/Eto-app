import 'package:eto_ride/app/core/utils/enums/user_type.dart';
import 'package:eto_ride/app/modules/account/view/driver_account_screen.dart';
import 'package:eto_ride/app/modules/activity/view/driver_activity_screen.dart';
import 'package:eto_ride/app/modules/home/view/driver_home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../account/view/account_view.dart';
import '../../activity/view/activity_view.dart';
import '../../home/view/home_view.dart';
import '../../service/view/service_view.dart';
import '../controller/shell_controller.dart';

class ShellView extends GetView<ShellController> {
  final UserType userType;
  var user;

  ShellView({super.key,  this.userType = UserType.PASSENGER,required this.user});

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = userType == UserType.PASSENGER ? [
      HomeView(passenger: user),
      ServiceView(),
      DriverActivityScreen(),
      DriverAccountScreen(),
    ] : [
      DriverHomeScreen(driver: user,),
      ServiceView(),
      DriverActivityScreen(),
      DriverAccountScreen(),
    ];
    return Scaffold(
      body: Obx(
            () => IndexedStack(
          index: controller.currentIndex.value,
          children: _children,
        ),
      ),
      bottomNavigationBar: Obx(
            () => Stack(
          children: [
            BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: controller.changeTabIndex,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.black),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.miscellaneous_services, color: Colors.black),
                  label: 'Service',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_activity, color: Colors.black),
                  label: 'Activity',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle, color: Colors.black),
                  label: 'Account',
                ),
              ],
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              top: 4,
              left: (MediaQuery.of(context).size.width / 4) * controller.currentIndex.value,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}