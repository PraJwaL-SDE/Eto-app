import 'package:eto_ride/app/data/storage/setting_storage.dart';
import 'package:eto_ride/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/view/continue_btn.dart';
import '../../common/view/language_card.dart';
import '../controller/select_language_controller.dart';
import '../../get_started/view/user_type_screen.dart';

class SelectLanguageScreen extends GetView<SelectLanguageController> {
  const SelectLanguageScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> languages = const [
    {"image": "assets/images/english_a.png", "name": "English"},
    {"image": "assets/images/hindi_a.png", "name": "Hindi"},
    {"image": "assets/images/begali_a.png", "name": "Bengali"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Select Your \nLanguage",
                  style: TextStyle(fontSize: 40),
                ),
                Image.asset(
                  "assets/images/translate_logo.png",
                  width: 80,
                  height: 80,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Get prompt and reliable assistance anytime with our comprehensive town-wide services.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 4 / 2.5,
              ),
              itemCount: languages.length,
              itemBuilder: (context, index) {
                final language = languages[index];
                return Obx(
                      () => GestureDetector(
                    onTap: () {
                      controller.updateLanguage(language["name"]!);

                    },
                    child: LanguageCard(
                      imageAsset: language["image"]!,
                      languageName: language["name"]!,
                      isSelected: controller.selectedLanguage.value ==
                          language["name"],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Obx(
                  () => ContinueBtn(
                onPressed:()async{
                  if(controller.isLanguageSelected()){
                    print("${controller.selectedLanguage.value} is selected");
                    await SettingStorage()..clearSettings();
                    SettingStorage().updateLanguage(controller.selectedLanguage.value);
                    Get.offAndToNamed(AppRoutes.USER_TYPE);
                  }
                },

                text: "Continue",
                textColor: Colors.white,
                backgroundColor: controller.isLanguageSelected()
                    ? const Color(0xFF1D9B58)
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
