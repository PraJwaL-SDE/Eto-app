import 'package:flutter/material.dart';

class RatingInfoScreen extends StatelessWidget {
  const RatingInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Rating"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rating Image
            Center(
              child: Image.asset(
                "assets/images/rating/rating_bg.png",
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),

            // Heading: How is the rating determined?
            const Text(
              "How is the rating determined?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),

            // Explanation Text
            const Text(
              "Out of five stars, your rating is determined by averaging all of your previous ratings. No rating for a specific ride will ever be visible to you or your captains because ratings are completely anonymous.",
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Heading: Acknowledging Ratings
            const Text(
              "Acknowledging Ratings",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),

            // Explanation Text
            const Text(
              "To promote mutual respect, customers and captains can rate each other on a 1–5 scale. Continue reading to find out how you may be a 5 STAR customer, as explained below:",
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Guidelines
            _buildGuideline(
              imagePath: "assets/images/rating/partner.png",
              title: "Recognize your captain",
              description:
              "You can become a five-star rider by learning more about the factors that influence a captain's happiness.",
            ),
            const SizedBox(height: 16),
            _buildGuideline(
              imagePath: "assets/images/rating/time.png",
              title: "Timely",
              description:
              "Verify that the address you provided for pick-up is correct. Be on time for the pickup location. This aids the captain in getting you where you're going on schedule.",
            ),
            const SizedBox(height: 16),
            _buildGuideline(
              imagePath: "assets/images/rating/kindness.png",
              title: "Kindness",
              description:
              "A \"Hello\" or a grin go a long way! Remember to treat your captain the way you want to be treated.",
            ),
            const SizedBox(height: 16),
            _buildGuideline(
              imagePath: "assets/images/rating/safety.png",
              title: "Safety",
              description:
              "At all times, every Captain and Rider is expected to abide by the traffic regulations.",
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build guideline rows
  Widget _buildGuideline({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon/Image
        Image.asset(
          imagePath,
          width: 40,
          height: 40,
        ),
        const SizedBox(width: 16),

        // Title and Description
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
