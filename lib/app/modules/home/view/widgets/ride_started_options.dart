import 'package:eto_ride/app/data/models/ride_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/colors/constant_colors.dart';
import '../../../common/view/app_button.dart';

class RideStartedOptions extends StatelessWidget {
  RideModel rideModel;
  Function endRide;

   RideStartedOptions({super.key,required this.rideModel,required this.endRide});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// **Driver Info**
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  foregroundImage: AssetImage("assets/icons/account/avatar.png"),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rideModel.passengerName ?? "Unknown",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        _buildTag("Luggage", ConstantColors.primary),
                        const SizedBox(width: 8),
                        _buildTag("Cash", Colors.black),
                        const SizedBox(width: 8),
                        _buildTag("sos", Colors.black),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// **Trip Details**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTripDetail("${rideModel.travelDistance} km", "Distance"),
                _buildTripDetail("05 min", "Time"),
                _buildTripDetail("₹${rideModel.fare}", "Estimated Price"),
              ],
            ),
            const SizedBox(height: 16),


            Row(
              children: [

                Expanded(
                  child: AppButton(
                    text: "End Ride",
                    onPressed: (){

                    },
                    backgroundColor: Colors.black,
                    borderRadius: 100,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// **Helper Method: Build Trip Detail**
  Widget _buildTripDetail(String value, String label) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }

  /// **Helper Method: Build Tag**
  Widget _buildTag(String text, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  /// **Helper Method: Build Action Tile**
  Widget _buildActionTile(IconData icon, String label, Color iconColor, {bool isDark = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isDark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isDark ? Colors.white : iconColor),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(fontSize: 14, color: isDark ? Colors.white : Colors.black, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
