import 'package:get/get.dart';

class SelectLanguageController extends GetxController {
  final selectedLanguage = "".obs; // Reactive variable for selected language

  void updateLanguage(String language) {
    selectedLanguage.value = language;

  }

  bool isLanguageSelected() {
    return selectedLanguage.value.isNotEmpty;
  }
}
