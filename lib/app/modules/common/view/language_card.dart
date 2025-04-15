import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  final String imageAsset;
  final String languageName;
  final bool isSelected;

  const LanguageCard({
    super.key,
    required this.imageAsset,
    required this.languageName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 175,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? const Color(0xFF1D9B58) : Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(imageAsset),
                const SizedBox(height: 18),
                Text(languageName),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              top: 4,
              left: 4,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF1D9B58),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
