import 'package:eto_ride/app/modules/common/view/app_button.dart';
import 'package:eto_ride/app/modules/home/controller/driver_home_controller.dart';
import 'package:eto_ride/app/modules/home/view/widgets/driver_status_card.dart';
import 'package:eto_ride/app/modules/home/view/widgets/driver_verify_otp_card.dart';
import 'package:eto_ride/app/modules/home/view/widgets/otp_input_card.dart';
import 'package:eto_ride/app/modules/home/view/widgets/passenger_waiting_status_card.dart';
import 'package:eto_ride/app/modules/home/view/widgets/ride_complete_popup.dart';
import 'package:eto_ride/app/modules/home/view/widgets/ride_request_card.dart';
import 'package:eto_ride/app/modules/home/view/widgets/ride_request_expanded_card.dart';
import 'package:eto_ride/app/modules/home/view/widgets/ride_started_options.dart';
import 'package:eto_ride/app/modules/home/view/widgets/ride_started_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverHomeScreen extends GetView<DriverHomeController> {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Obx(
        () => Stack(
          children: <Widget>[
            // Google Map Widget
            GoogleMap(
              onMapCreated: controller.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: controller.center.value,
                zoom: 11.0,
              ),
              markers: controller.markers.toSet(),
              myLocationEnabled: true,
              zoomControlsEnabled: false,
            ),

            // Driver Status Card
            if (controller.showDriverStatus.value)
              Positioned(
                top: 50,
                left: 16,
                right: 16,
                child: SizedBox(

                  child: DriverStatusCard(
                    isOnline: false,
                    onToggleOnline: (val) => {},
                  ),
                ),
              ),

            // Ride Request Cards
            if (controller.showRideRequest.value)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: screenSize.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.showRideRequest.value = false;
                            controller.showDriverStatus.value = false;
                            controller.showRideRequestExpanded.value = true;
                          },
                          child: RideRequestCard(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            if (controller.showRideRequestExpanded.value)
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.showRideRequestExpanded.value = false;
                        controller.showVerifyOtpWidgets.value = true;
                      },
                      child: RideRequestExpandedCard(),
                    ),
                  ),
                ),
              ),

            if (controller.showVerifyOtpWidgets.value)
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: PassengerWaitingStatusCard(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            controller.showVerifyOtpWidgets.value = false;
                            controller.showOtpBoxes.value = true;
                          },
                          child: DriverVerifyOtpCard(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            if (controller.showOtpBoxes.value)
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.showOtpBoxes.value = false;
                        controller.showTripStarted.value = true;
                      },
                      child: OtpInputCard(),
                    ),
                  ),
                ),
              ),
            if (controller.showTripStarted.value)
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: RideStartedStatus(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            controller.showVerifyOtpWidgets.value = false;
                            controller.showTripStarted.value = false;
                            controller.showRideComplete.value = true;
                          },
                          child: GestureDetector(
                            child: RideStartedOptions(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            if (controller.showRideComplete.value)
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 100,
                      children: [
                        Container(
                          width: double.infinity,
                          child: RideCompletePopup(),
                        ),
                        Container(
                          width: double.infinity,
                          child: AppButton(
                            text: "Mark as complete Ride",
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            borderRadius: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
