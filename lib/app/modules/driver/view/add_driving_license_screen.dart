import 'dart:io';
import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:eto_ride/app/core/utils/image/image_manager.dart';
import 'package:eto_ride/app/data/provider/driver/update_driver_document.dart';
import 'package:eto_ride/app/data/provider/image_provider.dart';
import 'package:eto_ride/app/modules/common/view/app_button.dart';
import 'package:eto_ride/app/modules/common/view/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDrivingLicenseScreen extends StatefulWidget {
  final String userId;
  const AddDrivingLicenseScreen({super.key, required this.userId});

  @override
  _AddDrivingLicenseScreenState createState() =>
      _AddDrivingLicenseScreenState();
}

class _AddDrivingLicenseScreenState extends State<AddDrivingLicenseScreen> {
  File? imageFile;
  String? licenseNumber;
  String? dateOfBirth;
  bool isLoading = false;

  Future<void> _uploadDocument(BuildContext context) async {
    if (licenseNumber == null || licenseNumber!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the license number')),
      );
      return;
    }
    if (dateOfBirth == null || dateOfBirth!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your date of birth')),
      );
      return;
    }
    if (imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image first!')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final docLink = await ServerImageProvider().uploadImage(imageFile!);
      if (docLink != null) {
        await UpdateDriverDocument().updateDrivingLicence(
          widget.userId,
          licenseNumber!,
          docLink,
          dateOfBirth!,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Document uploaded successfully!')),
        );
        Get.back(); // Navigate back
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to upload the document')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("Add Driving License"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                AppTextField(
                  hintText: "CH123456789",
                  onChanged: (value) => licenseNumber = value,
                ),
                const SizedBox(height: 16),
                Text("Date of Birth", style: textTheme.titleMedium),
                const SizedBox(height: 8),
                AppTextField(
                  hintText: "15-02-2000",
                  onChanged: (value) => dateOfBirth = value,
                ),
                const SizedBox(height: 24),
                Text("Upload Documents", style: textTheme.headlineSmall),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    final pickedFile = await ImageManager().pickImageFromGallery();
                    if (pickedFile != null) {
                      setState(() {
                        imageFile = pickedFile;
                      });
                    }
                  },
                  child: Container(
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
                          subtitle: const Text(
                              "Supported file: .PNG/.JPG Max size: 5MB"),
                        ),
                      ],
                    ),
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
                        onPressed: () => Get.back(),
                      ),
                      const SizedBox(height: 16),
                      AppButton(
                        text: "Submit",
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        onPressed: () => _uploadDocument(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
