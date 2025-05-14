import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/utils/enums/user_type.dart';
import '../../../data/provider/auth_services.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  Future<dynamic> signInWithGoogle(
      {UserType userType = UserType.PASSENGER}) async {
    isLoading.value = true;
    var serverUser;
    try {
      // final passenger = await AuthServices.login(user.uid);
      if (userType == UserType.PASSENGER) {
        final passenger = await AuthServices.signInPassengerWithGoogle();
        serverUser = passenger;
      } else {
        final driver = await AuthServices.signInDriverWithGoogle();
        serverUser = driver;
      }
    } catch (e) {}
    isLoading.value = false;
    return serverUser;
  }
}
