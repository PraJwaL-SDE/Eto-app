import 'package:eto_ride/screens/bottom_nav/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/continue_btn.dart';
import '../../widgets/custom_text.dart';

class EnterDetailScreen extends StatefulWidget {
  const EnterDetailScreen({super.key});

  @override
  State<EnterDetailScreen> createState() => _EnterDetailScreenState();
}

class _EnterDetailScreenState extends State<EnterDetailScreen> {
  // Controllers for input fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Enter Details",
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            CustomText(
              text: "Enter your basic details to get started",
              fontSize: 18,
            ),
            const SizedBox(height: 16),
            // Custom input fields
            CustomDetailInput(
              label: "First Name",
              hint: "Please enter first name",
              controller: firstNameController,
              inputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomDetailInput(
              label: "Last Name",
              hint: "Please enter last name",
              controller: lastNameController,
              inputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomDetailInput(
              label: "Date of Birth",
              hint: "DD/MM/YYYY",
              controller: dobController,
              inputType: TextInputType.datetime,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                LengthLimitingTextInputFormatter(10), // Maximum 10 characters
              ],
            ),
            const SizedBox(height: 16),
            ContinueBtn(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation(firebaseUser: null)));
              },
              text: "Continue",
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
