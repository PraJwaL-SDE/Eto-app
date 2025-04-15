import 'package:flutter/material.dart';
import '../../../../core/constant/colors/constant_colors.dart';

class OtpInputCard extends StatelessWidget {
  const OtpInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// **Title**
            Text(
              "Verify OTP",
              style: TextStyle(
                fontSize: 22, // Large text for heading
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            /// **Subtitle**
            Text(
              "Please enter the OTP sent to User",
              style: TextStyle(
                fontSize: 16, // Medium text size
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            /// **OTP Input Fields**
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6.0),
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: ConstantColors.primary,
                          width: 2,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 20, // Large text for OTP digits
                      fontWeight: FontWeight.bold,
                    ),
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
