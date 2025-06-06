import 'package:eto_ride/app/data/models/ride_model.dart';
import 'package:flutter/material.dart';

class RideRequestCard extends StatelessWidget {
  RideModel rideModel;
   RideRequestCard({super.key, required this.rideModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Theme.of(context).primaryColor),
      ),
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Ride Request Title**
            const Text(
              "Hey! You got a new Ride request",
              style: TextStyle(
                fontSize: 16, // Medium text size
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            /// **User Info**
            ListTile(
              leading: const CircleAvatar(
                foregroundImage: AssetImage("assets/icons/account/avatar.png"),
              ),
              title:  Text(
                rideModel.passengerName ?? "Passenger",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: const Text(
                        "Cash",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),

              /// **Ride Details**
              trailing:  Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "₹${rideModel.fare}", // Price (Added ₹ symbol for clarity)
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Estimated ${rideModel.travelDistance} km",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
