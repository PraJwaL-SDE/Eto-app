import 'package:eto_ride/screens/auth/enter_detail_screen.dart';
import 'package:eto_ride/utils/constant_color.dart';
import 'package:eto_ride/widgets/continue_btn.dart';
import 'package:eto_ride/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx/resend_otp_timer_controller.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final ResendOtpTimerController resendOtpTimerController =
  ResendOtpTimerController();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    // Calls the `decreaseTime` function every second
    Future.delayed(Duration.zero, () {
      resendOtpTimerController.decreaseSeconds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Verify OTP",
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: "Sent to ",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
                children: [
                  TextSpan(
                    text: "+0000 000 000",
                    style: TextStyle(
                      color: ConstantColor.primary,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Handle mobile number change logic
              },
              child: const Text(
                "Change your Mobile Number?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                4,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 50,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: ConstantColor.primary,
                          width: 2,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Obx(
                    () => Text(
                  resendOtpTimerController.secondsLeft.value > 0
                      ? "Resend code in 00:${resendOtpTimerController.secondsLeft.value.toString().padLeft(2, '0')} Sec"
                      : "Resend OTP",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ContinueBtn(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EnterDetailScreen()));
              },
              text: "Verify",
              backgroundColor: ConstantColor.primary,
              showArrow: false,
            ),
          ],
        ),
      ),
    );
  }
}
