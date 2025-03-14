import 'package:eto_ride/screens/auth/verify_otp_screen.dart';
import 'package:eto_ride/screens/bottom_nav/bottom_navigation.dart';
import 'package:eto_ride/services/auth_services.dart';
import 'package:eto_ride/utils/constant_color.dart';
import 'package:eto_ride/widgets/continue_btn.dart';
import 'package:eto_ride/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class EnterMobleScreen extends StatefulWidget {
  const EnterMobleScreen({super.key});

  @override
  State<EnterMobleScreen> createState() => _EnterMobleScreenState();
}

class _EnterMobleScreenState extends State<EnterMobleScreen> {
  bool isChecked = false;

  final AuthServices authServices = AuthServices();


  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Enter your mobile number",
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            const CustomText(
              text:
                  "This number will be used for every communication. You shall receive an SMS with a code for verification.",
              fontSize: 18,
              textColor: Colors.black,
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 16.0, left: 16),
                  child: Text(
                    "+91",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "Your number",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              thickness: 1.5,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  activeColor: ConstantColor.primary,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: "I have read and agreed to the ",
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(
                          text: "Terms and Conditions.",
                          style: TextStyle(
                            color: ConstantColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ContinueBtn(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => VerifyOtpScreen()));
              },
              text: "Get OTP",
              backgroundColor: Colors.black,
              showArrow: false,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  width: 90,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "f",
                      style: TextStyle(fontSize: 30,color: Colors.black),

                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.zero, // Remove internal padding
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 90,
                  child: ElevatedButton(
                    onPressed: () async{
                      var user = await  AuthServices.signInWithGoogle();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => BottomNavigation(currentIdx: 3, firebaseUser: user!,)));
                    },
                    child: Text(
                      "G",
                      style: TextStyle(fontSize: 30,color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.zero, // Remove internal padding
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
