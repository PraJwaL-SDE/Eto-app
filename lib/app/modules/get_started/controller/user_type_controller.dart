import 'package:get/get.dart';

import '../../../core/utils/enums/user_type.dart';

class UserTypeController extends GetxController {
  final selectedUserType = Rx<UserType?>(null);

  void updateUserType(UserType type) {
    selectedUserType.value = type;
  }

  bool isUserTypeSelected() {
    return selectedUserType.value != null;
  }
}
