import 'package:get/get.dart';

class ModeController extends GetxController {
  bool isDark = false;

  void changeMode(bool status) {
    isDark = status;
    update();
  }
}
