import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:eto_ride/app/core/constant/symbols/constant_symbol.dart';
import 'package:flutter/material.dart';

class DriverEarningTile extends StatelessWidget {
  const DriverEarningTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Date Container
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  "17",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "June",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),

          /// Location & Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gurgaon, Sec 49",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              const Text(
                "05:45 AM",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),

          /// Payment Type
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: ConstantColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "Cash",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ConstantColors.primary,
              ),
            ),
          ),

          /// Fare Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildEarningRow("Earning:", "${ConstantSymbol.INR} 85", ConstantColors.primary),
              _buildEarningRow("Service Fee:", "${ConstantSymbol.INR} 20", Colors.red),
              _buildEarningRow("Total Fare:", "${ConstantSymbol.INR} 100", Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  /// Helper method to build earning rows
  Widget _buildEarningRow(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
