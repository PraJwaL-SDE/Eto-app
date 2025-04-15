import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _userDetail(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "App Settings",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            _buildListTile(
              iconPath: "assets/icons/account/help_support.png",
              title: "Help & Support",
              onTap: (){
                Get.toNamed(AppRoutes.HELP_SUPPORT);
              }
            ),
            const Divider(),
            _buildListTile(
              iconPath: "assets/icons/account/card_payment.png",
              title: "Payment",
              onTap: () {
                try{
                  Get.toNamed(AppRoutes.PAYMENT_SETTING);
                }catch(e){
                  print(e);
                }

              },
            ),
            const Divider(),
            _buildListTile(
              iconPath: "assets/icons/account/clock.png",
              title: "My Rides",
            ),
            const Divider(),
            _buildListTile(
              iconPath: "assets/icons/account/notification.png",
              title: "Notification",
              onTap: (){
                Get.toNamed(AppRoutes.NOTIFICATION);
              }
            ),
            const Divider(),
            _buildListTile(
              iconPath: "assets/icons/account/refer_earn.png",
              title: "Refer & Earn",
              onTap: (){
                Get.toNamed(AppRoutes.REFER_EARN);
              }
            ),
            const Divider(),
            _buildListTile(
              iconPath: "assets/icons/account/eto_coin.png",
              title: "Eto Coins",
              onTap: (){
                Get.toNamed(AppRoutes.COIN_BALANCE);
              }
            ),
            const Divider(),
            _buildListTile(
              iconPath: "assets/icons/account/rewards.png",
              title: "My Rewards",
            ),
            const Divider(),
            _buildListTile(
              iconPath: "assets/icons/account/half_sign_out.png",
              title: "Sign out",
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _userDetail() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          ListTile(
            leading: _fixedSizeImage("assets/icons/account/avatar.png"),
            title: const Text("Akash Rawat"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("+91 123 456 7890"),
                Text("akkurwt002@gmail.com"),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          ListTile(
            leading: _fixedSizeImage("assets/icons/account/starFill16x16.png"),
            title: const Text("4.5 My Rating"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: (){
              Get.toNamed(AppRoutes.RATING_INFO);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required String iconPath,
    required String title,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: _fixedSizeImage(iconPath),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }

  Widget _fixedSizeImage(String assetPath) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Image.asset(assetPath),
    );
  }
}
