import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:flutter/material.dart';

import '../../../common/view/app_button.dart';

class RideServicePopup extends StatelessWidget {
  const RideServicePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header with Title and Close Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Ride Services you want to provide",
                style: TextStyle(
                  fontSize: 18, // Slightly larger for better readability
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// Options List
          _options("Passenger", true),
          const SizedBox(height: 12),
          _options("Goods", false),
          const SizedBox(height: 12),
          _options("Both", false),
          const SizedBox(height: 20),

          /// Save Button
          SizedBox(
            width: double.infinity,
            child: AppButton(
              text: "Save",
              backgroundColor: Colors.black,
              textColor: Colors.white,
              textStyle: TextStyle(fontSize: 16,color: Colors.white), // Ensuring the button text is readable
            ),
          ),
        ],
      ),
    );
  }

  Widget _options(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? ConstantColors.primary : Colors.grey,
          width: 1.5, // Thicker border for better visibility
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16, // Increased for better readability
              fontWeight: FontWeight.w500,
              color: isSelected ? ConstantColors.primary : Colors.black,
            ),
          ),
          if (isSelected)
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: ConstantColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}
