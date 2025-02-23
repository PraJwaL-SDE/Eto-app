import 'package:get/get.dart';

class UsertypeController{
  var usertype = "".obs;
  void updateUsertype(String usertype){
    this.usertype.value = usertype;
  }

}
