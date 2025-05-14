import 'package:eto_ride/app/modules/account/controller/driver_account_controller.dart';
import 'package:eto_ride/app/modules/home/controller/driver_home_controller.dart';
import 'package:eto_ride/app/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';
import '../../home/binding/home_binding.dart';
import '../controller/shell_controller.dart';

class ShellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShellController());
    Get.lazyPut(() => DriverHomeController());
    Get.lazyPut(() => DriverAccountController());
    Get.lazyPut(()=>HomeController());

    HomeBinding().dependencies();
  }
}