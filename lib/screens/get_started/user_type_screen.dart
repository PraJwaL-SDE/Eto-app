import 'package:eto_ride/getx/usertype_controller.dart';
import 'package:eto_ride/screens/get_started/get_started_screen.dart';
import 'package:eto_ride/widgets/continue_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/select_usertype_card.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  final UsertypeController usertypeController = UsertypeController();

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
            Text(
              "Continue with\nEto rides as an?",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
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
                    usertypeController.updateUsertype("passenger");
                  },
                  child: SelectUsertypeCard(
                    title: "Use Eto rides as\nPassenger",
                    subtitle: "This number will be used for\nevery communication.",
                    imageAsset: "assets/images/person_logo.png",
                    selected: usertypeController.usertype.value == "passenger",
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    usertypeController.updateUsertype("driver");
                  },
                  child: SelectUsertypeCard(
                    title: "Join us as Eto \nDriver Partner",
                    subtitle: "This number will be used for\nevery communication.",
                    imageAsset: "assets/images/driver_logo.png",
                    selected: usertypeController.usertype.value == "driver",
                  ),
                ),
              ],
            )),
            const SizedBox(height: 30),
            ContinueBtn(
              onPressed: () {
                // Add functionality here
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GetStartedScreen()));
              },
              text: "Continue",
              backgroundColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
