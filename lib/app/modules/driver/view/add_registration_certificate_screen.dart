import 'dart:io';
import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:eto_ride/app/core/utils/image/image_manager.dart';
import 'package:eto_ride/app/data/provider/driver/update_driver_document.dart';
import 'package:eto_ride/app/data/provider/image_provider.dart';
import 'package:eto_ride/app/modules/common/view/app_button.dart';
import 'package:eto_ride/app/modules/common/view/app_text_field.dart';
import 'package:eto_ride/app/modules/driver/view/widgets/upload_documenent_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRegistrationCertificateScreen extends StatefulWidget {
  final String userId;
  const AddRegistrationCertificateScreen({super.key, required this.userId});

  @override
  _AddRegistrationCertificateScreenState createState() => _AddRegistrationCertificateScreenState();
}

class _AddRegistrationCertificateScreenState extends State<AddRegistrationCertificateScreen> {
  File? imageFile;
  String? vehicleNumber;
  bool isLoading = false;

  Future<void> _uploadDocument(BuildContext context) async {
    if (vehicleNumber == null || vehicleNumber!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the vehicle number')),
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
        await UpdateDriverDocument().updateRC(
          widget.userId,
          vehicleNumber!,
          docLink,
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
        title: const Text("Add Registration Certificate"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Take a photo of your Registration Certificate",
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  "Your profile photo helps people recognize you. Please note that once you have submitted your profile photo, it cannot be changed.",
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Center(
                  child: Image.asset(
                    "assets/images/get_started/driver_rc.png",
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text("Vehicle number", style: textTheme.titleMedium),
                const SizedBox(height: 8),
                AppTextField(
                  hintText: "1234 5678 9000",
                  backgroundColor: ConstantColors.textFieldBgLight,
                  showBorder: false,
                  onChanged: (value) => vehicleNumber = value,
                ),
                const SizedBox(height: 24),
                Text("Upload Documents", style: textTheme.titleMedium),
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
                  child: const UploadDocumentContainer(),
                ),
                const SizedBox(height: 24),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      text: "Submit",
                      textColor: Colors.white,
                      backgroundColor: Colors.black,
                      borderRadius: 100,
                      onPressed: () => _uploadDocument(context),
                    ),
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
