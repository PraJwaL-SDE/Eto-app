import 'package:flutter/material.dart';

import '../../../../core/constant/colors/constant_colors.dart';
import '../../../common/view/app_button.dart';

class UploadDocumentContainer extends StatelessWidget {
  const UploadDocumentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
