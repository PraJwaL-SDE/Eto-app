import 'package:flutter/material.dart';

import '../../../../core/constant/colors/constant_colors.dart';
import '../../../common/view/continue_btn.dart';

class DriverDetailOptions extends StatelessWidget {
  const DriverDetailOptions({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "Mukesh Kumar";
    double rating = 5.0;
    String vehicleNumber = "DL0070F00";
    String otp = "9090";
    String distance = "02 km";
    String time = "05 min";
    String estimatedPrice = "22.0";

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Driver Info
              Expanded(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/128/2202/2202112.png"),
                  ),
                  title: Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.star, color: ConstantColors.primary, size: 18),
                      SizedBox(width: 4),
                      Text("$rating Rating"),
                    ],
                  ),
                ),
              ),
              // Vehicle Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    vehicleNumber,
                    style: TextStyle(
                        color: ConstantColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Vehicle Number",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 10),

          // OTP Row
          Row(
            children: [
              Text(
                "Ride OTP",
                style: TextStyle(fontSize: 25),
              ),
              Spacer(),
              otpBox(otp[0]),
              otpBox(otp[1]),
              otpBox(otp[2]),
              otpBox(otp[3]),
            ],
          ),
          SizedBox(height: 10),

          // Ride Info Container
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rideInfo(distance, "Distance"),
                rideInfo(time, "Time"),
                rideInfo(estimatedPrice, "Estimated Price"),
              ],
            ),
          ),
          SizedBox(height: 10),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              actionButton(
                  icon: Icons.my_location,
                  text: "Shared live location",
                  iconColor: ConstantColors.primary),
              actionButton(icon: Icons.chat, text: "Chat"),
              actionButton(
                  icon: Icons.call,
                  text: "Call",
                  iconColor: Colors.white,
                  bgColor: Colors.black),
            ],
          ),
          SizedBox(height: 10),
          // Cancel Ride Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ContinueBtn(
              onPressed: () {},
              text: "Cancel Ride",
              showArrow: false,
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget otpBox(String num) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ConstantColors.primary,
      ),
      child: Center(
        child: Text(
          num,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget rideInfo(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 25),
        ),
        Center(
          child: Text(label),
        ),
      ],
    );
  }

  Widget actionButton({
    required IconData icon,
    required String text,
    Color iconColor = Colors.black,
    Color bgColor = const Color(0xFFE3F2FD),
    Color textColor = Colors.black, // Add textColor parameter
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(color: textColor), // Apply text color
          ),
        ],
      ),
    );
  }

}
