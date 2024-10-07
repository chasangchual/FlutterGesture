import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0;

  void increase() {
    count++;
    update();
  }
}
