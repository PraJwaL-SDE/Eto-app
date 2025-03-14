import 'package:eto_ride/utils/constant_color.dart';
import 'package:flutter/material.dart';

class PaymentTypeTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentTypeTile({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey.shade200 : Colors.white,
            borderRadius: BorderRadius.circular(8),

          ),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Radio<bool>(
                value: true,
                groupValue: isSelected,
                onChanged: (value) {
                  if (value == true) {
                    onTap();
                  }
                },
                activeColor: ConstantColor.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
