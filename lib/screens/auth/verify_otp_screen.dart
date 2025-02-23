import 'package:eto_ride/utils/constant_color.dart';
import 'package:eto_ride/widgets/continue_btn.dart';
import 'package:eto_ride/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    String timeString = "00:30sec";

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Verify OTP",fontSize: 50,fontWeight: FontWeight.bold,),

            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: "Sent to ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30, // Set font size to 20
                ),
                children: [
                  TextSpan(
                    text: "+0000 000 000",
                    style: TextStyle(
                      color: ConstantColor.primary,
                      fontSize: 30, // Set font size to 20
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
              child: Text("change your Mobile Number?", style: TextStyle(decoration: TextDecoration.underline,),),
            ),
            const SizedBox(height: 24),
            // 4 input boxes for OTP with square border and rounded corners
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                4,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0), // Spacing between boxes
                  width: 50,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "", // Remove length counter
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                        borderSide: BorderSide(color: ConstantColor.primary, width: 2),
                      ),
                    ),
                    style: TextStyle(
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
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CustomText(
                  text: "Resend code in $timeString",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(

                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(20.0) //                 <--- border radius here
                ),
              ),
            ),
            const SizedBox(height: 24),
            ContinueBtn(
              onPressed: () {
                // Handle OTP verification logic
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
