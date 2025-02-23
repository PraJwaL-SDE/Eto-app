import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLanguage = "".obs;

  void updateLanguage(String language) {
    selectedLanguage.value = language;
  }
}
