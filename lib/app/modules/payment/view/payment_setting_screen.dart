import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PaymentSettingScreen extends StatelessWidget {
  const PaymentSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Methods",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset("assets/icons/payment/money_hand.png"),
              ),
              title: Text("Cash"),
            ),
            ListTile(
              leading: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset("assets/icons/payment/money_hand.png"),
              ),
              title: Text("Payment Gateway"),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: ListTile(
                leading: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset("assets/icons/payment/passbook.png"),
                ),
                title: Text("View All Transactions"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed(AppRoutes.TRANSACTIONS);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
