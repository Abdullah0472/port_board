import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountViewModel extends GetxController {

  /// -------------- Personal Information -------------- ///
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final digitCodeController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  ////////////////////////Validation for Email///////////////////////////
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter your email..";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'enter your password...';
    } else {
      if (value != passwordController.value.text) {
        'validPasswordText1'.tr;
        return null;
      } else {
        return null;
      }
    }
  }
}