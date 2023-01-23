import 'package:get/get.dart';

class MainScreenController extends GetxController {
  RxInt value = 0.obs;

  RxString date = 'Date'.obs;

  void add() {
    value.value++;
    update();
  }

  void subtract() {
    value.value--;
    update();
  }
}
