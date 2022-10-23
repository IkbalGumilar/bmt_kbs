import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isChecked = true.obs;

  switching() {
    isChecked.value == false ? isChecked.value = true : isChecked.value = false;
  }
}
