import 'package:eto_ride/app/modules/notification/view/widgets/notification_list_item.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                "Control your notification",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: Switch(
                value: false,
                onChanged: (val) {},
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Normally, we don't overload your account with notifications. You can receive notifications about news, offers, and real-time captain updates here. If you would still like to turn off the notice, you can choose this option.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Divider(height: 32, thickness: 1),
            const Text(
              "Notifications",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
              itemBuilder: (context, idx) {
                return const NotificationListItem();
              },
            ),
          ],
        ),
      ),
    );
  }
}
