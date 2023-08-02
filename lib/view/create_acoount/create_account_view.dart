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
class CreateAccountView extends StatelessWidget {
  CreateAccountView({Key? key}) : super(key: key);

  final signInVM = Get.put(CreateAccountViewModel());

  GlobalKey<FormState> signinformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                              "Create an Account",
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
                              SizedBox(
                                height: Get.height * 0.05,
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
                                controllerpass: signInVM.passwordController
                                    .value,
                                icons: const Icon(Icons.lock,
                                    color: AppColor.greyColor),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              const Text(
                                'Password should contain both letters and number,with minimun length of 8 characters ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.greyColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: Get.height * 0.08,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'Already have an account? Log In',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.greenTextField,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                        ),

                        SizedBox(height: Get.height * 0.03,),
                       RoundButton(
                            textColor: signInVM.passwordController.value.text
                                .isEmpty // Change color based on text
                                ? Colors.grey
                                .shade800 // Change this to your desired color when text is empty
                                : AppColor.whiteColor,
                            buttonColor: signInVM.passwordController.value.text
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
                            title: 'Create An Account',
                          ),

                        const SizedBox(height: 10,),
                        const Text(
                          'By proceeding, you agree to Tu Paquete ',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.greyColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          'Term of Use & Privacy',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.greenTextField,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              ),
            )),
      );
  }
}
