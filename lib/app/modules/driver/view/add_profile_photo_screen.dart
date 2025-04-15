import 'package:flutter/material.dart';

import '../../../core/constant/colors/constant_colors.dart';
import '../../common/view/app_button.dart';
import '../../common/view/app_text_field.dart';

class AddProfilePhotoScreen extends StatelessWidget {
  const AddProfilePhotoScreen({super.key});

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
              "Take your profile photo",
              style: textTheme.headlineMedium,
            ),
            Text("Your profile photo helps people recognise you. Please note that once you have submitted your profile photo it cannot be changed",
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                "assets/images/get_started/Take_photo_avatar.png",
                height: 150,
              ),
            ),
            const SizedBox(height: 16),

            Text("Upload Documents", style: textTheme.titleMedium),
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
              child: Container(
                width: double.infinity,
                child: AppButton(
                  text: "Submit",
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
    );
  }
}
