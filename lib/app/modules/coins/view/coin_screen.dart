import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinScreen extends StatelessWidget {
  const CoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eto Coins"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Utilize Eto coins to receive a transportation discount!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),

              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset("assets/images/coin/coin_minus.png"),
                        title: const Text("1 coin equals ₹1"),
                      ),
                      ListTile(
                        leading: Image.asset("assets/images/coin/coupon.png"),
                        title: const Text("Use with coupons"),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images/coin/coin.png",
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.white,
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Eto Coin Balance",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Image.asset("assets/images/coin/coin.png",height: 40,width: 40,),

                      ],
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text(
                "Always use Eto coins",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Switch(
                value: false,
                onChanged: (val) {},
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: Image.asset("assets/images/coin/passbook.png"),
                title: const Text(
                  "Coin Transactions",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed(AppRoutes.COIN_TRANSACTION);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
