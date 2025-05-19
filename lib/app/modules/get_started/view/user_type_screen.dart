import 'package:eto_ride/app/data/storage/setting_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/enums/user_type.dart';
import '../../common/view/continue_btn.dart';
import '../../common/view/select_usertype_card.dart';
import '../controller/user_type_controller.dart';
import '../../../routes/app_routes.dart';

class UserTypeScreen extends GetView<UserTypeController> {
  const UserTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the default back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Continue with\nEto rides as an?",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "This number will be used for every\ncommunication.",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.updateUserType(UserType.PASSENGER);
                  },
                  child: SelectUsertypeCard(
                    title: "Use Eto rides as\nPassenger",
                    subtitle: "This number will be used for\nevery communication.",
                    imageAsset: "assets/images/person_logo.png",
                    selected: controller.selectedUserType.value == UserType.PASSENGER,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    controller.updateUserType(UserType.DRIVER);

                  },
                  child: SelectUsertypeCard(
                    title: "Join us as Eto \nDriver Partner",
                    subtitle: "This number will be used for\nevery communication.",
                    imageAsset: "assets/images/driver_logo.png",
                    selected: controller.selectedUserType.value == UserType.DRIVER,
                  ),
                ),
              ],
            )),
            const SizedBox(height: 30),
            Obx(
                  () => ContinueBtn(
                onPressed: (){

                  if(controller.isUserTypeSelected()) {
                    print(controller.selectedUserType.value);
                    SettingStorage().updateUserType(controller.selectedUserType.value ?? UserType.PASSENGER);
                    Get.toNamed(AppRoutes.GET_STARTED,arguments: {'userType':controller.selectedUserType.value});
                  }
                },

                text: "Continue",
                backgroundColor: controller.isUserTypeSelected()
                    ? Colors.black
                    : Colors.grey, // Grey out the button if no selection
              ),
            ),
          ],
        ),
      ),
    );
  }
}
