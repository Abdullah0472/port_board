
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:port_board/utils/utils.dart';
import 'package:port_board/view_model/create_account/create_account_view_model.dart';
import '../../../colors/colors.dart';

// ignore: must_be_immutable
class InputPasswordTextField extends StatefulWidget {
  final Icon icons;
  bool isPasswordType;
  final TextEditingController controllerpass;
  final String hintText;
  final String? Function(String?)? validator;
  InputPasswordTextField(
      {Key? key,
      required this.isPasswordType,
      required this.controllerpass,
      this.validator,
        this.hintText = "Enter your password...",
      required this.icons})
      : super(key: key);

  @override
  State<InputPasswordTextField> createState() => _InputPasswordTextFieldState();
}

class _InputPasswordTextFieldState extends State<InputPasswordTextField> {
  final signInVM = Get.put(CreateAccountViewModel());
  void inContact(TapDownDetails details) {
    setState(() {
      widget.isPasswordType = false;
    });
  }

  void outContact(TapUpDetails details) {
    setState(() {
      widget.isPasswordType = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, signInVM.emailFocusNode.value,
            signInVM.passwordFocusNode.value);
      },
      style:  TextStyle(
          color: AppColor.blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w400),
      controller: widget.controllerpass,
      obscureText: widget.isPasswordType,
      obscuringCharacter: "*",
      enableSuggestions: widget.isPasswordType,
      autocorrect: widget.isPasswordType,
      cursorColor: Colors.grey,
      minLines: 1,
      decoration: InputDecoration(
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
        contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 15,
        ),

        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        // contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: InputBorder.none,
        fillColor: Colors.transparent,

        suffixIcon:

            GestureDetector(
          onTapDown: inContact,
          onTapUp: outContact,
          child: const Icon(
            Icons.remove_red_eye,
            color: AppColor.greyColor,
          ),
        ),
        //   ),
      ),
      keyboardType: widget.isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      validator: widget.validator,
    );
  }
}
