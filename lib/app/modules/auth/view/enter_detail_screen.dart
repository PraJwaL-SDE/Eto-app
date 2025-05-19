import 'package:eto_ride/app/data/models/driver_model.dart';
import 'package:eto_ride/app/data/provider/driver_provider.dart';
import 'package:eto_ride/app/data/provider/passenger_provider.dart';
import 'package:eto_ride/app/modules/auth/controller/complete_detail_controller.dart';
import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';  // Import Cubit
import '../../../core/utils/enums/user_type.dart';
import '../../../data/models/passenger_model.dart';
import '../../common/view/continue_btn.dart';
import '../../common/view/custom_text.dart';
import '../cubit/complete_detail_cubit.dart';



class EnterDetailScreen extends StatelessWidget {
  final UserType userType;
  final dynamic user; // Use `dynamic` for flexibility with different user types.

  final controller = Get.put(CompleteDetailController());
   EnterDetailScreen({
    super.key,
    this.userType = UserType.PASSENGER,
    required this.user,
  });


  @override
  Widget build(BuildContext context) {


    void handleSubmit() async {
      await controller.updateUserDetail(userType, user);
      print("Handle submit logic with controllers");
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Enter Details",
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            const CustomText(
              text: "Enter your basic details to get started",
              fontSize: 18,
            ),
            const SizedBox(height: 16),
            CustomDetailInput(
              label: "First Name",
              hint: "Please enter first name",
              controller: controller.firstNameController,
              inputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomDetailInput(
              label: "Last Name",
              hint: "Please enter last name",
              controller: controller.lastNameController,
              inputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomDetailInput(
              label: "Date of Birth",
              hint: "DD/MM/YYYY",
              controller: controller.dobController,
              inputType: TextInputType.datetime,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            const SizedBox(height: 16),
            ContinueBtn(
              onPressed: handleSubmit,
              text: controller.isLoading.value ? "Loading": "Continue",
              backgroundColor: Colors.black,
              showArrow: false,
            ),
          ],
        ),
      ),
    );
  }
}



class CustomDetailInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomDetailInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.inputType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}