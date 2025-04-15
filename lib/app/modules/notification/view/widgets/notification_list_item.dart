import 'package:flutter/material.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        "assets/icons/account/avatar.png",
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
      title: const Text(
        "Your driver has reached your desired location. Check driver details.",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: const Text(
        "9:42 AM",
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}
