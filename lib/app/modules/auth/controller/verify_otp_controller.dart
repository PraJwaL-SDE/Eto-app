import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final secondsLeft = 30.obs; // Resend OTP countdown in seconds
  final otpDigits = List<String>.filled(4, "").obs; // Stores the entered OTP digits

  @override
  void onInit() {
    super.onInit();
    startResendTimer();
  }

  void startResendTimer() {
    // Decreases the timer every second
    if (secondsLeft.value > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        secondsLeft.value--;
        if (secondsLeft.value > 0) {
          startResendTimer();
        }
      });
    }
  }

  void resendOtp() {
    if (secondsLeft.value == 0) {
      secondsLeft.value = 30;
      startResendTimer();
      // Logic to resend OTP can be added here
    }
  }

  bool isOtpComplete() {
    return otpDigits.every((digit) => digit.isNotEmpty);
  }

  void verifyOtp() {
    if (isOtpComplete()) {
      // Add OTP verification logic here
      Get.toNamed(AppRoutes.ENTER_DETAIL);
    } else {
      Get.snackbar('Error', 'Please enter all OTP digits');
    }
  }
}
