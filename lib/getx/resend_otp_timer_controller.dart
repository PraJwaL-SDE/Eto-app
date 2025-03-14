import 'package:get/get.dart';

class ResendOtpTimerController extends GetxController {
  RxInt secondsLeft = 30.obs; // Initial countdown time

  void decreaseSeconds() {
    if (secondsLeft > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        secondsLeft.value--;
        decreaseSeconds(); // Call again for continuous countdown
      });
    }
  }
}
