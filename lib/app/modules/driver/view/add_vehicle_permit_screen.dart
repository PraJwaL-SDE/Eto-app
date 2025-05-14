import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors/constant_colors.dart';
import '../../../core/utils/image/image_manager.dart';
import '../../../data/provider/driver/update_driver_document.dart';
import '../../../data/provider/image_provider.dart';
import '../../common/view/app_button.dart';


class AddVehiclePermitScreen extends StatefulWidget {
  final String userId;
  const AddVehiclePermitScreen({super.key, required this.userId});

  @override
  _AddVehiclePermitScreenState createState() => _AddVehiclePermitScreenState();
}

class _AddVehiclePermitScreenState extends State<AddVehiclePermitScreen> {
  File? imageFile;
  bool isLoading = false;

  Future<void> _uploadDocument(BuildContext context) async {
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
        await UpdateDriverDocument().updateVehiclePermit(
          widget.userId,
          docLink,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vehicle permit document uploaded successfully!')),
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
        title: const Text("Add Vehicle Permit"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Take a photo of your Vehicle Permit",
                  style: textTheme.headlineMedium,
                ),
                Text(
                  "Your profile photo helps people recognize you. Please note that once you have submitted your profile photo, it cannot be changed.",
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                Center(
                  child: Image.asset(
                    "assets/images/get_started/vehicle_permit.png",
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
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
                          subtitle: const Text("Supported file: .PNG/.JPG Max size: 5MB"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Container(
                    width: double.infinity,
                    child: AppButton(
                      text: "Skip for now",
                      textColor: Colors.white,
                      backgroundColor: Colors.grey,
                      borderRadius: 100,
                      onPressed: () {
                        // Define button action here
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Container(
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
