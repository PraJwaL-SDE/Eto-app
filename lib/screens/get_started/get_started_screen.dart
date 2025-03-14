import 'package:eto_ride/screens/auth/enter_moble_screen.dart';
import 'package:eto_ride/widgets/continue_btn.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final PageController _pageController = PageController();
  int currentSlideIndex = 0;

  final List<Map<String, String>> slidesData = [
    {
      "image": "assets/images/get_started_screen_image.png",
      "title": "Book your reliable eto ride in town.",
      "description":
      "Wto Ride is your easy-to-go solution for getting around town with comfort.",
      "buttonText": "Get Started",
    },
    {
      "image": "assets/images/slide_2.png",
      "title": "Send your goods with eto",
      "description":
      "Need to send goods across town? \nLook no further than Eto for a dependable and efficient delivery service that meets all your shipping needs in town.",
      "buttonText": "Next",
    },
    {
      "image": "assets/images/slide_3.png",
      "title": "Eto coin makes your ride cost later",
      "description":
      "Discover a new way to save on transportation costs with Eto Coin, the innovative digital currency that makes your rides more affordable.",
      "buttonText": "Next",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentSlideIndex = index;
                });
              },
              itemCount: slidesData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topCenter, // Align content at the top
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Prevent extra space
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(slidesData[index]["image"]!),
                        const SizedBox(height: 16),
                        Text(
                          slidesData[index]["title"]!,
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          slidesData[index]["description"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: currentSlideIndex == 0
                ? ContinueBtn(
              onPressed: () {
                setState(() {
                  currentSlideIndex++;
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              },
              text: slidesData[currentSlideIndex]["buttonText"]!,
              backgroundColor: Colors.black,
            )
                : Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () async{
                  if (currentSlideIndex == slidesData.length - 1) {

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EnterMobleScreen(),
                      ),
                    );
                    var getStartVal = await  Hive.openBox<bool>('settingsBox');
                    getStartVal.put("get_start", true); // Save the value in the box
                  } else {
                    setState(() {
                      currentSlideIndex++;
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  slidesData[currentSlideIndex]["buttonText"]!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
