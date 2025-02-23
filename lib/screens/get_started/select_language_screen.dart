import 'package:eto_ride/screens/get_started/user_type_screen.dart';
import 'package:eto_ride/widgets/language_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/language_controller.dart';
import '../../widgets/continue_btn.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  final LanguageController languageController = Get.put(LanguageController());

  final List<Map<String, dynamic>> languages = [
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
                      languageController.updateLanguage(language["name"]);
                    },
                    child: LanguageCard(
                      imageAsset: language["image"],
                      languageName: language["name"],
                      isSelected: languageController.selectedLanguage.value ==
                          language["name"],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Obx(
              () => ContinueBtn(
                onPressed: () {
                  // Perform action based on selected language
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserTypeScreen()));
                },
                text: "Continue",
                textColor: Colors.white,
                backgroundColor:
                    languageController.selectedLanguage.value.isEmpty
                        ? Colors.grey
                        : const Color(0xFF1D9B58),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
