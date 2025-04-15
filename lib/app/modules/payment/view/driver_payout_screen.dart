import 'package:eto_ride/app/modules/payment/view/widgets/driver_payout_tile.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/colors/constant_colors.dart';
import '../../../core/constant/symbols/constant_symbol.dart';

class DriverPayoutScreen extends StatelessWidget {
  const DriverPayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Driver Payout",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Total Earnings Box
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ConstantColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    "Total Earnings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${ConstantSymbol.INR} 1500",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            /// Info Text
            const Text(
              "Your payout will be released every 15 days to your registered bank account.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            /// Search Box
            _buildSearchBox(),
            const SizedBox(height: 20),

            /// Payout List (Scrollable)
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const DriverPayoutTile(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Search Box Widget
  Widget _buildSearchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search by date",
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.grey),
            onPressed: () {
              // Implement date picker logic
            },
          ),
        ),
      ),
    );
  }
}
