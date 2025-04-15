import 'dart:async';

import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:flutter/material.dart';

class RideSearchingPopup extends StatefulWidget {
  const RideSearchingPopup({super.key});

  @override
  State<RideSearchingPopup> createState() => _RideSearchingPopupState();
}

class _RideSearchingPopupState extends State<RideSearchingPopup> {
  double part1Progress = 0;
  double part2Progress = 0;
  double part3Progress = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        part1Progress = 100;
      });

      Timer(const Duration(seconds: 2), () {
        setState(() {
          part2Progress = 100;
        });

        Timer(const Duration(seconds: 2), () {
          setState(() {
            part3Progress = 100;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Searching for rides nearby",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Driver will be on their way as soon as they confirm.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/get_started_screen_image.png",
              height: 150,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildProgressPart(part1Progress),
                const SizedBox(width: 4),
                _buildProgressPart(part2Progress),
                const SizedBox(width: 4),
                _buildProgressPart(part3Progress),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressPart(double progress) {
    return Expanded(
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            height: 10,
            width: progress,

            decoration: BoxDecoration(
                color: ConstantColors.primary,
                borderRadius: BorderRadius.circular(5)
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            height: 10,
            width: 100 - progress,

            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5)
            ),
          ),
        ],
      ),
    );
  }
}
