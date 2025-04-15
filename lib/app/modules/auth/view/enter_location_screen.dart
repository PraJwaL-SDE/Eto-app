import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:eto_ride/app/modules/common/view/app_button.dart';
import 'package:eto_ride/app/modules/common/view/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterLocationScreen extends GetView {
  const EnterLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Earn with Eto rides",
                style: textTheme.headlineLarge, // Using `headlineLarge`
              ),
              const SizedBox(height: 8),
              Text(
                "Decide when, where, and how you want to earn.",
                style: textTheme.bodyLarge?.copyWith(color: Colors.grey), // Using `bodyLarge`
              ),
              const SizedBox(height: 24),
              Text(
                "Where would you like to earn?",
                style: textTheme.titleMedium, // Using `titleLarge`
              ),
              const SizedBox(height: 8),
              AppTextField(
                hintText: "Enter your location",
                backgroundColor: ConstantColors.textFieldBgLight,
                showBorder: false,
              ),
              const SizedBox(height: 24),
              Text(
                "Referral Code (Optional)",
                style: textTheme.titleMedium, // Using `titleLarge`
              ),
              const SizedBox(height: 8),
              AppTextField(
                hintText: "Enter referral code",
                backgroundColor: ConstantColors.textFieldBgLight,
                showBorder: false,
              ),
              const SizedBox(height: 24),
              Text(
                "By proceeding, I agree that Uber or its representatives may contact me by email, phone, or text message (including by automatic telephone dialing system) using the email address or number I provide, including for marketing purposes.",
                style: textTheme.bodyLarge?.copyWith(color: Colors.grey, height: 1.5), // Using `bodyMedium`
              ),
              const SizedBox(height: 24),
              Center(
                child: Container(
                  width: double.infinity,
                  child: AppButton(
                    text: "Continue",
                    textColor: Colors.white,
                    backgroundColor: Colors.black,
                    borderRadius: 100,

                    onPressed: () {
                      // Define button action here
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
