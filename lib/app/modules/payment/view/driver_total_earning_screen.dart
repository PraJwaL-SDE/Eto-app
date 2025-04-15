import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:eto_ride/app/core/constant/symbols/constant_symbol.dart';
import 'package:eto_ride/app/modules/payment/view/widgets/driver_earning_tile.dart';
import 'package:flutter/material.dart';

class DriverTotalEarningScreen extends StatelessWidget {
  const DriverTotalEarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Total Earning",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            /// Earnings Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ConstantColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text(
                    "Total Earning",
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
            const SizedBox(height: 20),

            /// Search Box with Calendar Icon
            _buildSearchBox(),
            const SizedBox(height: 20),

            /// My Rides Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Rides",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),

            /// List of 10 DriverEarningTiles
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => const Divider(thickness: 1, height: 15),
                itemBuilder: (context, index) {
                  return const DriverEarningTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Search Box with Calendar Icon
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
          hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
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
