import 'package:eto_ride/app/modules/common/view/app_button.dart';
import 'package:eto_ride/app/modules/common/view/pickup_and_drop_card.dart';
import 'package:eto_ride/app/modules/home/view/widgets/ride_request_card.dart';
import 'package:flutter/material.dart';

class RideRequestExpandedCard extends StatelessWidget {
  const RideRequestExpandedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// **Ride Request Card**
        const RideRequestCard(),
        const SizedBox(height: 12),

        /// **Pickup & Drop Card**
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: PickupAndDropCard(),
            ),
          ),
        ),
        const SizedBox(height: 20),

        /// **Action Buttons**
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  text: "Decline",
                  backgroundColor: Colors.grey,
                  borderRadius: 100,
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton(
                  text: "Accept",
                  backgroundColor: Colors.black,
                  borderRadius: 100,

                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
