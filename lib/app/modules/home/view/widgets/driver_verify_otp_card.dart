import 'package:flutter/material.dart';
import '../../../../core/constant/colors/constant_colors.dart';
import '../../../common/view/app_button.dart';

class DriverVerifyOtpCard extends StatelessWidget {
  const DriverVerifyOtpCard({super.key});

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
                      "Akash Rawat",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        _buildTag("Luggage", ConstantColors.primary),
                        const SizedBox(width: 8),
                        _buildTag("Cash", Colors.black),
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
                _buildTripDetail("02 km", "Distance"),
                _buildTripDetail("05 min", "Time"),
                _buildTripDetail("₹22.00", "Estimated Price"),
              ],
            ),
            const SizedBox(height: 16),

            /// **Action Buttons (Share, Chat, Call)**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionTile(Icons.my_location, "Share live location", ConstantColors.primary),
                _buildActionTile(Icons.chat, "Chat", Colors.black),
                _buildActionTile(Icons.call, "Call", Colors.white, isDark: true),
              ],
            ),
            const SizedBox(height: 16),

            /// **Accept & Decline Buttons**
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: "Decline",
                    backgroundColor: Colors.grey,
                    borderRadius: 100,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppButton(
                    text: "Accept",
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
