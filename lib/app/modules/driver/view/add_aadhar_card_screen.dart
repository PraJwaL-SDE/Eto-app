import 'package:eto_ride/app/modules/driver/view/widgets/upload_documenent_container.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/colors/constant_colors.dart';
import '../../common/view/app_button.dart';
import '../../common/view/app_text_field.dart';

class AddAadharCardScreen extends StatelessWidget {
  const AddAadharCardScreen({super.key});

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
      body: SingleChildScrollView(
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
            ),
            const SizedBox(height: 24),
            Text("Upload Documents", style: textTheme.titleMedium),
            const SizedBox(height: 16),
            const UploadDocumentContainer(),
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
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
