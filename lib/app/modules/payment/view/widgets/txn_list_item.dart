import 'package:eto_ride/app/core/constant/symbols/constant_symbol.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TxnListItem extends StatelessWidget {
  const TxnListItem({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime(2023, 6, 17, 6, 30);
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Date Container
              Container(
                padding: const EdgeInsets.all(8.0),
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: CupertinoColors.systemGrey6,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      time.day.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      months[time.month - 1],
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16), // Space between date and details
              // Transaction Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Debit",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${ConstantSymbol.INR}52 paid via cash",
                      style: const TextStyle(color: CupertinoColors.systemRed),
                    ),
                    Text(
                      "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              // Transaction Amount
              Container(
                alignment: Alignment.center,
                height: 60, // Ensures it aligns with the row height
                child: Text(
                  "${ConstantSymbol.INR}52",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16, color: CupertinoColors.systemRed),
                ),
              ),
            ],
          ),
        ),
        const Divider(), // Divider at the end of each item
      ],
    );
  }
}
