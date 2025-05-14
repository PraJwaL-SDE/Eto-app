import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverDocumentScreen extends GetView {
  final String driverId;
  const DriverDocumentScreen({required this.driverId, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, Akash",
                style: textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                "Here’s what you need to do to set up your account",
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              _buildListTile(
                context,
                title: "Driving License",
                route: AppRoutes.DRIVER_DRIVING_LICENSE,
              ),
              _buildDivider(),
              _buildListTile(
                context,
                title: "Profile Photo",
                route: AppRoutes.DRIVER_PROFILE_PHOTO,
              ),
              _buildDivider(),
              _buildListTile(
                context,
                title: "Aadhaar Card",
                route: AppRoutes.DRIVER_AADHAR_CARD,
              ),
              _buildDivider(),
              _buildListTile(
                context,
                title: "PAN Card",
                route: AppRoutes.DRIVER_PAN_CARD,
              ),
              _buildDivider(),
              _buildListTile(
                context,
                title: "Registration Certificate (RC)",
                route: AppRoutes.DRIVER_REGISTRATION_CERTIFICATE,
              ),
              _buildDivider(),
              _buildListTile(
                context,
                title: "Vehicle Insurance",
                route: AppRoutes.DRIVER_VEHICLE_INSURANCE,
              ),
              _buildDivider(),
              _buildListTile(
                context,
                title: "Vehicle Permit",
                route: AppRoutes.DRIVER_VEHICLE_PERMIT,
              ),
              _buildDivider(),
              _buildListTile(
                context,
                title: "Bank Details",
                route: AppRoutes.DRIVER_BANK_DETAIL,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, {required String title, required String route}) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      title: Text(
        title,
        style: textTheme.titleSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () {
        // Pass the driverId when navigating to the next screen
        Get.toNamed(route, arguments: {'driverId': driverId});
      },
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
    );
  }
}
