import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/utils/toast_utils.dart';
import 'package:get/get.dart';

import '../utils/Utils.dart';

class HomeController extends GetxController {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController ageTextController = TextEditingController();

  final GlobalKey<CustomEditTextState> nameEditTextKey = GlobalKey<CustomEditTextState>();
  final GlobalKey<CustomEditTextState> ageEditTextKey = GlobalKey<CustomEditTextState>();

  RxInt count = 0.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }

  bool validateFields() {
    if (nameTextController.text.isEmpty) {
      showToast("Name cannot be empty");
      return false;
    }
    if (ageTextController.text.isEmpty) {
      showToast("Age cannot be empty");
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    nameTextController.dispose(); // Dispose to prevent memory leaks
    ageTextController.dispose(); // Dispose to prevent memory leaks
    super.onClose();
  }
}
