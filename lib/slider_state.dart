import 'package:gesture/log.dart';
import 'package:get/get.dart';

class SliderState extends GetxController {
  static SliderState get to => Get.find();

  var sliderValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setSliderValue(double value) {
    Log.s.d("set $value to slider state");
    sliderValue.value = value;
  }

  double getSliderValue() {
    Log.s.d("get slider state of $sliderValue.value");
    return sliderValue.value;
  }
}
