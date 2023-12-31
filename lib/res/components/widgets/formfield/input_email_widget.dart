import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:port_board/utils/utils.dart';
import 'package:port_board/view_model/create_account/create_account_view_model.dart';

import '../../../colors/colors.dart';

// ignore: must_be_immutable
class InputEmailTextField extends StatelessWidget {
  final Icon icons;
  final String hintText;
  final bool number;
  TextEditingController controller;
  final String? Function(String?)? validator;
  final signInVM = Get.put(CreateAccountViewModel());
  InputEmailTextField({
    super.key,
    required this.validator,
    required this.controller,
    required this.icons,
    this.number = true,
    this.hintText = 'Enter your email address...',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: number ? TextInputType.emailAddress : TextInputType.phone,
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(
          context,
          signInVM.emailFocusNode.value,
          signInVM.passwordFocusNode.value,
        );
      },
      cursorColor: Colors.grey,
      style: TextStyle(
          color: AppColor.blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        // prefixIcon: icons,
        // prefixIconColor: AppColor.greyColor,
        contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
        //  contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: InputBorder.none,
        //fillColor: const Color.fromARGB(255, 251, 250, 249),
        fillColor: Colors.transparent,

        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 15,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: AppColor.greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: AppColor.greenTextField),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: AppColor.redColor),
        ),
      ),
    );
  }
}
