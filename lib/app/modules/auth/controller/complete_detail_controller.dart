import 'package:eto_ride/app/core/utils/enums/user_type.dart';
import 'package:eto_ride/app/data/storage/driver_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../data/models/driver_model.dart';
import '../../../data/models/passenger_model.dart';
import '../../../data/provider/driver_provider.dart';
import '../../../data/provider/passenger_provider.dart';
import '../../../data/storage/passenger_storage.dart';
import '../../../routes/app_routes.dart';

class CompleteDetailController extends GetxController{
  final TextEditingController firstNameController = TextEditingController(text: "prajwal");
  final TextEditingController lastNameController = TextEditingController(text: "kamble");
  final TextEditingController dobController = TextEditingController();
  var isLoading = false.obs;
  
  Future updateUserDetail(UserType userType,dynamic user)async{
    try {
      if (userType == UserType.PASSENGER) {
        final Passenger passenger = user as Passenger;
        passenger.firstName = firstNameController.text;
        passenger.lastName = lastNameController.text;

        print("calling update passenger");

        final res = await PassengerProvider.updatePassengerData(passenger);

        if (res != null) {
          PassengerStorage().updateAndSaveCurrent(passenger);
          Get.toNamed(
            AppRoutes.SHELL,
            arguments: {
              'userType': userType,
              'user': passenger,
            },
          );

        }
      } else {
        final Driver driver = user as Driver;
        driver.firstName = firstNameController.text;
        driver.lastName = lastNameController.text;

        final res = await DriverProvider.updateDriverData(driver);

        if (res) {
          DriverStorage().updateAndSaveDriver(driver);
          Get.toNamed(
            AppRoutes.SHELL,
            arguments: {
              'userType': userType,
              'user': driver,
            },
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }
}