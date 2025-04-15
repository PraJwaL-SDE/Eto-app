import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help & Support"),),
      body: Column(
        children: [
          ListTile(
            title: Text("Safety & Security"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              Get.toNamed(AppRoutes.SAFETY_SECURITY);
            },
          ),
          Divider(),
          ListTile(
            title: Text("Ride Billing"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
        ],
      ),
    );
  }
}
