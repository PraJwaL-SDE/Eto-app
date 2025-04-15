import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:eto_ride/app/modules/common/view/app_button.dart';
import 'package:eto_ride/app/modules/common/view/app_text_field.dart';
import 'package:flutter/material.dart';

class BankDetailPopup extends StatelessWidget {
  const BankDetailPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            const Text(
              "Add Bank Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),

            /// Subtitle
            const Text(
              "You can add your bank details here",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 15),

            /// Bank Account Number
            _buildLabel("Bank account number*"),
            const SizedBox(height: 5),
            _buildTextField("0940 0000 0000 0000"),

            /// IFSC Code
            const SizedBox(height: 15),
            _buildLabel("IFSC Code"),
            const SizedBox(height: 5),
            _buildTextField("SBIN09284"),

            /// Account Holder Name
            const SizedBox(height: 15),
            _buildLabel("Account Holder Name"),
            const SizedBox(height: 5),
            _buildTextField("Enter account holder name"),

            /// Save Button
            const SizedBox(height: 20),
            AppButton(
              text: "Save",
              backgroundColor: ConstantColors.primary,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Label Widget
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  /// TextField Wrapper inside Material
  Widget _buildTextField(String hintText) {
    return Material(
      color: Colors.transparent,
      child: AppTextField(hintText: hintText),
    );
  }
}
