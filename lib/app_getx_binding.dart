import 'package:gesture/checkbox_state.dart';
import 'package:gesture/radio_state.dart';
import 'package:gesture/slider_state.dart';
import 'package:gesture/switch_state.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckboxState());
    Get.put(RadioState());
    Get.put(SliderState());
    Get.put(SwitchState());
  }
}
