import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:port_board/res/appBar/custom_appBar.dart';
import 'package:port_board/res/colors/colors.dart';
import 'package:port_board/res/components/widgets/formfield/input_email_widget.dart';
import 'package:port_board/view_model/create_account/create_account_view_model.dart';
import '../../res/components/widgets/buttons/round_button_widget.dart';
import '../../res/components/widgets/formfield/input_password_widget.dart';

// ignore: must_be_immutable
class ConfirmView extends StatefulWidget {
  ConfirmView({Key? key}) : super(key: key);

  @override
  State<ConfirmView> createState() => _ConfirmViewState();
}

class _ConfirmViewState extends State<ConfirmView> {
  final signInVM = Get.put(CreateAccountViewModel());

  GlobalKey<FormState> signinformkey = GlobalKey<FormState>();
  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarProfile(
        title: 'Create an Account',
      ),
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Form(
              key: signinformkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    MdiIcons.chevronLeft,
                    size: 30,
                    color: AppColor.greyColor,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  const Text(
                    'Let’s confirm it’s you',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: AppColor.blackColor),
                  ),
                  const Text(
                    'We sent a code by text message (SMS) to (***)***-0903',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    '6-Digit Code',
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  InputEmailTextField(
                      hintText: '',
                      validator: signInVM.validateEmail,
                      controller: signInVM.digitCodeController.value,
                      icons: const Icon(
                        Icons.email,
                        color: AppColor.greyColor,
                      )),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _checkbox,
                        onChanged: (value) {
                          setState(() {
                            _checkbox = !_checkbox;
                          });
                        },
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const Text(
                    'Why remember this device? with this option, you won’t need to use a verfication code when you log in using this device.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  RoundButton(
                    textColor: signInVM.digitCodeController.value.text
                            .isEmpty // Change color based on text
                        ? Colors.grey
                            .shade800 // Change this to your desired color when text is empty
                        : AppColor.whiteColor,
                    buttonColor: signInVM.digitCodeController.value.text
                            .isEmpty // Change color based on text
                        ? Colors.grey
                            .shade300 // Change this to your desired color when text is empty
                        : AppColor.greenTextField,
                    width: Get.width,
                    height: Get.height * 0.06,
                    onPress: () {
                      if (signinformkey.currentState!.validate()) {
                        signInVM.emailController.value.clear();
                        signInVM.passwordController.value.clear();
                      }
                    },
                    title: 'Continue',
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  const Text(
                    'Need another code? ',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Send New Code',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.greenTextField,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Note: Tu Paquete will never call to ask for your password or verification code ',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
        ),
      )),
    );
  }
}
