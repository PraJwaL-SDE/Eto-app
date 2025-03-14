import 'package:get/get.dart';
class BottomNavController extends GetxController{
  var currentIdx = 0.obs;
  void changeTab(int index){
    currentIdx.value = index;
  }
}
