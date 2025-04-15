import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:eto_ride/app/modules/common/view/app_button.dart';
import 'package:eto_ride/app/modules/common/view/app_text_field.dart';
import 'package:flutter/material.dart';

class AddDrivingLicenseScreen extends StatelessWidget {
  const AddDrivingLicenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your license number & date of birth",
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                "assets/images/get_started/license.png",
                height: 150,
              ),
            ),
            const SizedBox(height: 16),
            Text("License Number", style: textTheme.titleMedium),
            const SizedBox(height: 8),
            AppTextField(hintText: "CH123456789"),
            const SizedBox(height: 16),
            Text("Date of Birth", style: textTheme.titleMedium),
            const SizedBox(height: 8),
            AppTextField(hintText: "15-02-2000"),
            const SizedBox(height: 24),
            Text("Upload Documents", style: textTheme.headlineSmall),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade50,
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AppButton(
                    text: "Use Camera",
                    leading: const Icon(Icons.add_a_photo_outlined),
                    backgroundColor: ConstantColors.primary,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Expanded(child: Divider(color: Colors.grey)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("OR"),
                      ),
                      const Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: Icon(
                      Icons.drive_folder_upload_outlined,
                      color: ConstantColors.primary,
                    ),
                    title: const Text("Select document from device"),
                    subtitle: const Text("Supported file: .PNG/.JPG Max size: 5MB"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  AppButton(
                    text: "Skip for Now",
                    backgroundColor: Colors.grey.shade300,
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    text: "Submit",
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
