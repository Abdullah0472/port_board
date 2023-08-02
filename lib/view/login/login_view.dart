import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:port_board/res/appBar/custom_appBar.dart';
import 'package:port_board/res/assets/images.dart';
import 'package:port_board/res/colors/colors.dart';
import 'package:port_board/res/components/widgets/formfield/input_email_widget.dart';
import 'package:port_board/res/routes/routes_name.dart';
import 'package:port_board/view_model/create_account/create_account_view_model.dart';
import '../../res/components/widgets/buttons/round_button_widget.dart';
import '../../res/components/widgets/formfield/input_password_widget.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final signInVM = Get.put(CreateAccountViewModel());

  GlobalKey<FormState> signinformkey = GlobalKey<FormState>();

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          MdiIcons.chevronLeft,
                          size: 30,
                          color: AppColor.greyColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.blackColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Email Address',
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputEmailTextField(
                              validator: signInVM.validateEmail,
                              controller: signInVM.emailController.value,
                              icons: const Icon(
                                Icons.email,
                                color: AppColor.greyColor,
                              )),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InputPasswordTextField(
                            validator: signInVM.validatePassword,
                            isPasswordType: true,
                            controllerpass: signInVM.passwordController.value,
                            icons: const Icon(Icons.lock,
                                color: AppColor.greyColor),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColor.greyColor,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.createAccountView);
                              },
                              child: Text(
                                'New to Tu Paquete? create an Account',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.35,
                    ),
                    RoundButton(
                      textColor: signInVM.passwordController.value.text.isEmpty // Change color based on text
                          ? Colors.grey.shade800 // Change this to your desired color when text is empty
                          : AppColor.whiteColor,
                      buttonColor: signInVM.passwordController.value.text.isEmpty // Change color based on text
                          ? Colors.grey.shade300 // Change this to your desired color when text is empty
                          : AppColor.greenTextField, // Change this to your desired color when text is not empty
                      width: Get.width,
                      height: Get.height * 0.06,
                      onPress: () {
                        if (signinformkey.currentState!.validate()) {
                          Get.toNamed(RouteName.verificationCodeView);
                          signInVM.emailController.value.clear();
                          signInVM.passwordController.value.clear();
                        }
                      },
                      title: 'Log In',
                    ),
                  ],
                )),
          ),
        )),
      );

  }
}
