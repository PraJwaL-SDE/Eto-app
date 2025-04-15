import 'package:flutter/material.dart';

import '../../../core/constant/colors/constant_colors.dart';
import '../../../core/constant/symbols/constant_symbol.dart';

class DriverTotalDistanceScreen extends StatelessWidget {
  const DriverTotalDistanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Distance Travelled",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Total Distance Travelled Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ConstantColors.primary),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text(
                    "Total Distance Travelled",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "1500 km",
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// Search Box
            _buildSearchBox(),
            const SizedBox(height: 20),

            /// List of Travel Records
            const Text(
              "Travel History",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: const [
                  _DistanceTile(title: "Today", distance: "16 km"),
                  _DistanceTile(title: "04-07-2024", distance: "20 km"),
                  _DistanceTile(title: "Last Week", distance: "110 km"),
                  _DistanceTile(title: "Last Month", distance: "420 km"),
                ],
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

/// Reusable Distance Tile
class _DistanceTile extends StatelessWidget {
  final String title;
  final String distance;

  const _DistanceTile({required this.title, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: const Text(
            "Total distance travelled",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          trailing: Text(
            distance,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(thickness: 1, height: 10),
      ],
    );
  }
}
