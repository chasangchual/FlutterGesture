import 'package:gesture/global_constant.dart';
import 'package:gesture/log.dart';
import 'package:get/get.dart';

class RadioState extends GetxController {
  static RadioState get to => Get.find();

  var radioGroupValue = RadioGroup.value1.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setRadioValue(RadioGroup value) {
    Log.s.d("set $value to radio button");
    radioGroupValue.value = value;
  }

  RadioGroup getRadioValue() {
    Log.s.d("get $radioGroupValue.value");
    return radioGroupValue.value;
  }
}
