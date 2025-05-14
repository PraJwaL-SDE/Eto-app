import 'package:eto_ride/app/core/utils/enums/user_type.dart';
import 'package:eto_ride/app/data/storage/setting_storage.dart';
import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GetStartedController extends GetxController {
  final UserType userType;

  GetStartedController({required this.userType});

  final slideData = <Map<String, String>>[].obs;
  final currentSlideIndex = 0.obs; // Add this for tracking the current slide index
  final pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    loadSlideData();
  }

  void loadSlideData() {
    slideData.value = userType == UserType.PASSENGER
        ? [
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
    ]
        : [
      {
        "image": "assets/images/get_started/driver_1.png",
        "title": "We prioritize our partners' safety",
        "description":
        "Get prompt and reliable assistance anytime with our comprehensive town-wide service.",
        "buttonText": "Get Started",
      },
      {
        "image": "assets/images/get_started/driver_2.png",
        "title": "Expand your business with eto",
        "description":
        "Get prompt and reliable assistance anytime with our comprehensive town-wide service.",
        "buttonText": "Next",
      },
      {
        "image": "assets/images/get_started/driver_3.png",
        "title": "Eto coins will help to grow income",
        "description":
        "Get prompt and reliable assistance anytime with our comprehensive town-wide service.",
        "buttonText": "Next",
      },
    ];
  }

  void nextPage() {
    if (currentSlideIndex.value < slideData.length - 1) {
      currentSlideIndex.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> finishSlides() async {
    SettingStorage().updateGetStartedComplete(true);
    Get.toNamed(AppRoutes.ENTER_MOBILE,arguments: {'userType':userType});

  }
}
