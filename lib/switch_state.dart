import 'package:gesture/log.dart';
import 'package:get/get.dart';

class SwitchState extends GetxController {
  static SwitchState get to => Get.find();

  var switchValue = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setSwitch(bool value) {
    Log.s.d("set $value to switch state");
    switchValue.value = value;
  }

  bool getSliderValue() {
    Log.s.d("get switch state of $switchValue.value");
    return switchValue.value;
  }
}
