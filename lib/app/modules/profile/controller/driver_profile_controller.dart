import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DriverProfileController extends GetxController {
  PanelController panelController = PanelController();
  var isPanelOpen = false.obs; // Observable boolean to track panel state

  void togglePanel() {
    if (panelController.isPanelOpen) {
      panelController.close();
      isPanelOpen.value = false;
    } else {
      panelController.open();
      isPanelOpen.value = true;
    }
  }
}
