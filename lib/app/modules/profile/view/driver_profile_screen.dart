import 'package:eto_ride/app/modules/profile/controller/driver_profile_controller.dart';
import 'package:eto_ride/app/modules/profile/view/widgets/bank_detail_popup.dart';
import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DriverProfileScreen extends GetView<DriverProfileController> {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: controller.panelController, // Attach PanelController
        minHeight: 0,
        maxHeight: 500, // Adjust height as per requirement
        backdropEnabled: true,
        panel: const BankDetailPopup(),
        onPanelOpened: () => controller.isPanelOpen.value = true,
        onPanelClosed: () => controller.isPanelOpen.value = false,
        body: Stack(
          children: [
            _buildMainContent(context),
            Obx(() {
              return IgnorePointer(
                ignoring: !controller.isPanelOpen.value,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  color: controller.isPanelOpen.value
                      ? Colors.black.withOpacity(0.5)
                      : Colors.transparent,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// Main Profile UI Content
  Widget _buildMainContent(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Profile",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            children: [
              _buildProfileTile(
                  icon: "assets/icons/profile/user.png",
                  title: "Name",
                  subtitle: "Akash Rawat"),
              _buildProfileTile(
                  icon: "assets/icons/profile/call.png",
                  title: "Mobile Number",
                  subtitle: "+91 123 456 7890"),
              _buildProfileTile(
                  icon: "assets/icons/profile/mail.png",
                  title: "Email",
                  subtitle: "akashrawat000@gmail.com"),
              _buildProfileTile(
                  icon: "assets/icons/profile/calendar.png",
                  title: "Date of Birth",
                  subtitle: "15-02-2000"),
              _buildProfileTile(
                  icon: "assets/icons/profile/gender.png",
                  title: "Gender",
                  subtitle: "Male"),
              _buildProfileTile(
                  icon: "assets/icons/profile/member.png",
                  title: "Member Since",
                  subtitle: "25 June 2024"),
              _buildProfileTile(
                  icon: "assets/icons/profile/language.png",
                  title: "Language",
                  subtitle: "English"),
              _buildProfileTile(
                icon: "assets/icons/profile/language.png",
                title: "Bank Detail",
                subtitle: "HDFC Bank - 0000",
                onTap: () {
                  controller.togglePanel();
                },
              ),
              GestureDetector(
                child: _buildDeleteAccountTile(),
                onTap: (){
                  Get.offAllNamed(AppRoutes.USER_TYPE);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Profile List Tile Builder
  Widget _buildProfileTile(
      {required String icon,
      required String title,
      required String subtitle,
      VoidCallback? onTap}) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(icon, width: 30, height: 30),
          title: Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          subtitle: Text(subtitle,
              style: const TextStyle(fontSize: 13, color: Colors.grey)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }

  /// Delete Account Tile
  Widget _buildDeleteAccountTile() {
    return Column(
      children: [
        ListTile(
          leading: Image.asset("assets/icons/profile/delete_ac.png",
              width: 30, height: 30),
          title: const Text("Delete Account",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          trailing: Image.asset("assets/icons/profile/bucket_red.png",
              width: 25, height: 25),
        ),
        const Divider(),
      ],
    );
  }
}
