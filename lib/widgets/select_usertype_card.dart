import 'package:flutter/material.dart';

import '../utils/constant_color.dart';

class SelectUsertypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;
  final bool selected;

  const SelectUsertypeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width

      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0), // Adds space between cards
      decoration: BoxDecoration(
        color: selected ? ConstantColor.primary : Colors.white, // Background color
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
        border: Border.all(
          color: selected ? ConstantColor.primary : Colors.grey.shade300, // Border color
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: selected ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: selected ? Colors.white70 : Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Image.asset(
            imageAsset,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
