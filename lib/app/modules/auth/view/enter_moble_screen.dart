import 'package:eto_ride/app/core/utils/enums/user_type.dart';
import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors/constant_colors.dart';
import '../../common/view/continue_btn.dart';
import '../../common/view/custom_text.dart';
import '../controller/login_controller.dart';

class EnterMobileScreen extends StatelessWidget {
  final UserType userType;
  final LoginController controller = Get.put(LoginController());

  EnterMobileScreen({super.key, this.userType = UserType.PASSENGER});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Obx(
            () => Stack(
          children: [
            if (controller.isLoading.value)
              const Positioned.fill(
                child: ModalBarrier(
                  dismissible: false,
                  color: Colors.black54,
                ),
              ),
            if (controller.isLoading.value)
              const Center(child: CircularProgressIndicator()),
            if (!controller.isLoading.value) _body(context),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    bool isChecked = false; // Stateless widgets need local state for checkboxes
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
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
                    activeColor: ConstantColors.primary,
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
                              color: ConstantColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ContinueBtn(
                onPressed: () {
                  Get.toNamed(AppRoutes.VERIFY_OTP);
                },
                text: "Get OTP",
                backgroundColor: Colors.black,
                showArrow: false,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 90,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "f",
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 90,
                    child: ElevatedButton(
                      onPressed: () async{
                        var user = await controller.signInWithGoogle(userType: userType);
                        Get.toNamed(AppRoutes.ENTER_DETAIL,arguments: {
                          'user':user,
                          'userType':userType
                        });
                      },
                      child: const Text(
                        "G",
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
