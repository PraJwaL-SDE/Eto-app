import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';

class CallingEmergencyScreen extends StatefulWidget {
  const CallingEmergencyScreen({super.key});

  @override
  State<CallingEmergencyScreen> createState() => _CallingEmergencyScreenState();
}

class _CallingEmergencyScreenState extends State<CallingEmergencyScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildWave(double begin, double end, double delay, double size) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double animationValue = ((_controller.value + delay) % 1.0);
        double scale = begin + (end - begin) * animationValue;
        double opacity = 1 - animationValue;
        return Opacity(
          opacity: opacity,
          child: DashedCircle(
            dashes: 30,
            color: Colors.white,
            strokeWidth: 1,
            gapSize: 3,
            child: Container(
              width: size * scale,
              height: size * scale,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Calling emergency...",
            style: TextStyle(fontSize: 20),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Please standby, we are currently requesting help. Your emergency contacts and nearby rescue services will see your call for help.",
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.red.withOpacity(0.5),
                        Colors.orange.withOpacity(1),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: size * 0.45,
                  height: size * 0.45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                buildWave(0.45, 0.8, 0.0, size),
                buildWave(0.45, 0.8, 0.33, size),
                buildWave(0.45, 0.8, 0.66, size),
                Container(
                  width: size * 0.35,
                  height: size * 0.35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.red.withOpacity(0.5),
                        Colors.orange.withOpacity(1),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "01",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
