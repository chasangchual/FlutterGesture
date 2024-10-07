import 'package:gesture/global_constant.dart';
import 'package:gesture/log.dart';
import 'package:get/get.dart';

class CheckboxState extends GetxController {
  static CheckboxState get to => Get.find();

  late List<bool> selectedOptions;
  late RadioGroup radioGroupValue;

  @override
  void onInit() {
    super.onInit();
    selectedOptions = [false, false, false].obs;
    radioGroupValue = RadioGroup.value1.obs.value;
  }

  bool getState(int i) {
    Log.s.d("get state of $i");
    bool selected = false;
    if (i < selectedOptions.length) {
      selected = selectedOptions[i];
    }
    return selected;
  }

  void select(int i) {
    Log.s.d("select $i");

    if (i < selectedOptions.length) {
      selectedOptions[i] = true;
    }
  }

  void deselect(int i) {
    Log.s.d("deselect $i");

    if (i < selectedOptions.length) {
      selectedOptions[i] = false;
    }
  }

  void setRadioValue(RadioGroup value) {
    radioGroupValue = value;
  }

  RadioGroup getRadioValue() => radioGroupValue;
}
