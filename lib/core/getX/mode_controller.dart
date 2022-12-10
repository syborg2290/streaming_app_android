import 'package:get/get.dart';

class ModeController extends GetxController {
  bool isDark = true;

  void changeMode(bool status) {
    isDark = status;
    update();
  }
}
