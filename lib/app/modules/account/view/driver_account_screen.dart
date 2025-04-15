import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:eto_ride/app/core/constant/symbols/constant_symbol.dart';
import 'package:eto_ride/app/modules/account/controller/driver_account_controller.dart';
import 'package:eto_ride/app/modules/account/view/widgets/ride_service_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../routes/app_routes.dart';

class DriverAccountScreen extends GetView<DriverAccountController> {
  const DriverAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.panelController.hide();
    return SlidingUpPanel(
      panel: RideServicePopup(),
      minHeight: 0,
      controller: controller.panelController,
      body: Scaffold(
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
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.DRIVER_PROFILE);
                },
                child: _userDetail(),),

              // Use the custom function for each balance box
              Row(
                children: [
                  Expanded(
                    child: _buildBalanceCard(
                      label: "Available Balance",
                      value: "${ConstantSymbol.INR} 1000",
                      imagePath: "assets/icons/account/circular_wallet.png",
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.DRIVER_EARNING);
                      },
                      child: _buildBalanceCard(
                        label: "Total Earnings",
                        value: "${ConstantSymbol.INR} 50000",
                        imagePath: "assets/icons/account/total_earning.png",
                      ),
                    ),
                  ),


                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildBalanceCard(
                      label: "Total Rides",
                      value: "120",
                      imagePath: "assets/icons/account/total_rides.png",
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.DRIVER_DISTANCE);
                      },
                      child: _buildBalanceCard(
                        label: "Distance Travelled",
                        value: "1500 km",
                        imagePath: "assets/icons/account/distance_travelled.png",
                      ),
                    ),
                  ),
                ],
              ),
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
                  onTap: () {
                    Get.toNamed(AppRoutes.HELP_SUPPORT);
                  }),
              const Divider(),
              _buildListTile(
                iconPath: "assets/icons/account/card_payment.png",
                title: "Payment",
                onTap: () {
                  try {
                    Get.toNamed(AppRoutes.PAYMENT_SETTING);
                  } catch (e) {
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
                iconPath: "assets/icons/account/fluent_person-money-24-filled.png",
                title: "Payout",
                onTap: (){
                  Get.toNamed(AppRoutes.DRIVER_PAYOUT);
                }
              ),
              const Divider(),
              _buildListTile(
                iconPath: "assets/icons/account/fluent_person-driving-24-filled.png",
                title: "Ride Services",
                onTap: (){
                  controller.panelController.open();

                }
              ),
              const Divider(),
              _buildListTile(
                  iconPath: "assets/icons/account/notification.png",
                  title: "Notification",
                  onTap: () {
                    Get.toNamed(AppRoutes.NOTIFICATION);
                  }),
              const Divider(),
              _buildListTile(
                  iconPath: "assets/icons/account/refer_earn.png",
                  title: "Refer & Earn",
                  onTap: () {
                    Get.toNamed(AppRoutes.REFER_EARN);
                  }),
              const Divider(),
              _buildListTile(
                  iconPath: "assets/icons/account/eto_coin.png",
                  title: "Eto Coins",
                  onTap: () {
                    Get.toNamed(AppRoutes.COIN_BALANCE);
                  }),

              const Divider(),
              _buildListTile(
                iconPath: "assets/icons/account/half_sign_out.png",
                title: "Sign out",
              ),
              const Divider(),
            ],
          ),
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
            onTap: () {
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

  // Function to build balance cards with dynamic label, value, and image
  Widget _buildBalanceCard({
    required String label,
    required String value,
    required String imagePath,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: ConstantColors.primary),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(imagePath),
          ),
        ],
      ),
    );
  }
}
