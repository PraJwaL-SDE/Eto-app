import 'package:eto_ride/app/modules/driver/view/widgets/upload_documenent_container.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/colors/constant_colors.dart';
import '../../common/view/app_button.dart';
import '../../common/view/app_text_field.dart';

class AddRegistrationCertificateScreen extends StatelessWidget {
  const AddRegistrationCertificateScreen({super.key});


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
              "Take a photo of your Registration Certificate",
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text("Your profile photo helps people recognise you. Please note that once you have submitted your profile photo it cannot be changed",style: textTheme.titleMedium,),

            Center(
              child: Image.asset(
                "assets/images/get_started/driver_rc.png",
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text("Vehicle number ", style: textTheme.titleMedium),
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
