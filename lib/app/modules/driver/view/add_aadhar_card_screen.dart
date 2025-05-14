import 'dart:io';
import 'package:eto_ride/app/core/utils/image/image_manager.dart';
import 'package:eto_ride/app/data/provider/driver/update_driver_document.dart';
import 'package:eto_ride/app/data/provider/image_provider.dart';
import 'package:eto_ride/app/modules/driver/view/widgets/upload_documenent_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get for navigation
import '../../../core/constant/colors/constant_colors.dart';
import '../../common/view/app_button.dart';
import '../../common/view/app_text_field.dart';

class AddAadharCardScreen extends StatefulWidget {
  final String userId;
  const AddAadharCardScreen({super.key, required this.userId});

  @override
  _AddAadharCardScreenState createState() => _AddAadharCardScreenState();
}

class _AddAadharCardScreenState extends State<AddAadharCardScreen> {
  File? imageFile;
  String? aadhaarNumber;
  bool isLoading = false;

  Future<void> _uploadDocument(BuildContext context) async {
    if (aadhaarNumber == null || aadhaarNumber!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the Aadhaar number')),
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
        await UpdateDriverDocument().updateAadhar(widget.userId, aadhaarNumber!, docLink);
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
        title: const Text("Add Aadhaar Card"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let’s find your Aadhaar card",
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/get_started/adhar_front.png",
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16),
                      Image.asset(
                        "assets/images/get_started/aadhar_back.png",
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text("Aadhaar Number", style: textTheme.titleMedium),
                const SizedBox(height: 8),
                AppTextField(
                  hintText: "1234 5678 9000",
                  backgroundColor: ConstantColors.textFieldBgLight,
                  showBorder: false,
                  onChanged: (value) => aadhaarNumber = value,
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
