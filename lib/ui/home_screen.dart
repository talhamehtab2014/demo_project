import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../controlers/home_controller.dart';
import '../utils/Utils.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppLocalizations.of(context)?.language ?? "ar",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
              children: [
                Obx(
                  () => Text(
                    controller.count.value.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                ),

                Visibility(
                  visible: true,
                  child: CustomButton(
                    text: "+",
                    onPressed: () {
                      controller.increment();
                    },
                    backgroundColor: Colors.green,
                    borderRadius: 12,
                    fontSize: 30,
                  ).marginOnly(top: 20),
                ),

                CustomButton(
                  text: "-",
                  onPressed: () {
                    controller.decrement();
                  },
                  borderRadius: 12,
                  fontSize: 30,
                ).marginOnly(top: 20),

                CustomEditText(
                  key: controller.nameEditTextKey,
                  controller: controller.nameTextController,
                  hintText: "Enter your name",
                  backgroundColor: Colors.white,
                  showBorder: true,
                  showBorderOnFocus: true,
                  keyboardType: TextInputType.name,
                ).marginOnly(top: 30),

                const SizedBox(height: 20),

                CustomEditText(
                  key: controller.ageEditTextKey,
                  controller: controller.ageTextController,
                  hintText: "write you age",
                  showBorder: true,
                  showBorderOnFocus: true,
                  keyboardType: TextInputType.number,
                ),

                ElevatedButton(
                  onPressed: () {
                    if (controller.validateFields()) {
                      print("all fields are valid");
                    }
                  },
                  child: const Text("Validate"),
                ).marginOnly(top: 30),
              ],
            )
            .marginOnly(top: 30)
            .paddingSymmetric(
              horizontal: 20,
            ), // Add padding to avoid full width touch edges
      ),
    );
  }
}
