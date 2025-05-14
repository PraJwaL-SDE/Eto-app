import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShellController extends GetxController {
  var currentIndex = 0.obs;
  PageController pageController = PageController();

  void changeTabIndex(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );

  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}