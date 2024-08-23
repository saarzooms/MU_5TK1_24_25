import 'package:get/get.dart';

class CounterController extends GetxController {
  int count = 0;
  increment() {
    count++;
    update();
  }

  decrement() {
    count--;
    update();
  }

  reset() {
    count = 0;
    update();
  }

  double() {
    count *= 2;
    update();
  }
}
