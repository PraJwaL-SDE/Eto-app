import 'package:flutter/material.dart';

class DriverStatusCard extends StatelessWidget {
  final bool isOnline;
  final Function(bool) onToggleOnline;

  const DriverStatusCard({
    super.key,
    required this.isOnline,
    required this.onToggleOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// **Driver Info**
          ListTile(
            leading: const CircleAvatar(
              radius: 28,
              foregroundImage: AssetImage("assets/icons/account/avatar.png"),
            ),
            title: const Text(
              "Shubham Kumar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                const Text(
                  "4.96",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 4),
                const Text(
                  "(5 reviews)",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // Ensure the trailing fits content
              children: [
                Text(
                  isOnline ? "Online" : "Offline",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: isOnline,
                  onChanged: onToggleOnline,
                ),
              ],
            ),
          ),

          /// **Statistics Section**
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoColumn(
                    image: "assets/images/home/total_earning_bag.png",
                    value: "₹300",
                    label: "Total Earnings",
                  ),
                  _buildInfoColumn(
                    image: "assets/images/home/white_auto.png",
                    value: "10",
                    label: "Rides Completed",
                  ),
                  _buildInfoColumn(
                    image: "assets/images/home/white_clock.png",
                    value: "8h",
                    label: "Active Hours",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **Helper Method: Build Info Column**
  Widget _buildInfoColumn({
    required String image,
    required String value,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 40,
          width: 40,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
