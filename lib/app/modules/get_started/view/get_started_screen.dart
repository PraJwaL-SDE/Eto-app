import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/get_started_controller.dart';

class GetStartedScreen extends GetView<GetStartedController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.slideData.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return PageView.builder(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),

                onPageChanged: (index) {
                  controller.currentSlideIndex.value = index;
                },
                itemCount: controller.slideData.length,
                itemBuilder: (context, index) {
                  final slide = controller.slideData[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(slide["image"]!),
                        const SizedBox(height: 16),
                        Text(
                          slide["title"]!,
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          slide["description"]!,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              final isLastSlide = controller.currentSlideIndex.value ==
                  controller.slideData.length - 1;
              return ElevatedButton(
                onPressed: () {
                  if (isLastSlide) {
                    controller.finishSlides();
                  } else {
                    controller.nextPage();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  controller
                      .slideData[controller.currentSlideIndex.value]["buttonText"]!,
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
