import 'package:flutter/material.dart';

import '../../../../core/constant/colors/constant_colors.dart';

class RideStartedStatus extends StatelessWidget {
  const RideStartedStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.grey[200], // Subtle background color
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **Header**
              Center(
                child: Text(
                  "We Believe in Pure Safety of Driver 👍",
                  style: TextStyle(
                    fontSize: 16, // Medium text size
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),

              /// **Ride Info Container**
              Container(
                decoration: BoxDecoration(
                  color: ConstantColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// **Passenger Waiting & Time**
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Trip has been started",
                            style: TextStyle(
                              fontSize: 18, // Title size
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Reaching in",
                              style: TextStyle(
                                fontSize: 14, // Small text size
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              "05 min",
                              style: TextStyle(
                                fontSize: 20, // Large text size
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    /// **Location Details**
                    ListTile(
                      leading: Icon(
                        Icons.location_pin,
                        color: ConstantColors.primary,
                        size: 28,
                      ),
                      title: Text(
                        "1207 W. Jersey St. Montreal, 57867",
                        style: TextStyle(
                          fontSize: 14, // Normal text size
                          color: Colors.white,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white70,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
