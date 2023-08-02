import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:port_board/res/appBar/custom_appBar.dart';
import 'package:port_board/res/assets/images.dart';
import 'package:port_board/res/colors/colors.dart';
import 'package:port_board/res/components/widgets/formfield/input_email_widget.dart';
import 'package:port_board/res/components/widgets/text/report_rich_text.dart';
import 'package:port_board/res/routes/routes_name.dart';
import 'package:port_board/view_model/create_account/create_account_view_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../res/components/widgets/buttons/round_button_widget.dart';
import '../../res/components/widgets/formfield/input_password_widget.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class VerificationCodeView extends StatelessWidget {
  VerificationCodeView({Key? key}) : super(key: key);
  String otpCode = "";

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      MdiIcons.chevronLeft,
                      size: 30,
                      color: AppColor.greyColor,
                    ),
                    SizedBox(height: Get.height * 0.09,),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        radius: 27,
                        child: const Icon(
                          MdiIcons.email,
                          size: 30,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02,),
                    const Center(
                      child: Text('You’ve got mail :)',style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: AppColor.blackColor
                      ),),
                    ),
                    SizedBox(height: Get.height * 0.02,),
                    const Center(
                      child: Text('Login instructions have been sent to:',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor
                      ),),
                    ),

                    const Center(
                      child: Text('tiecode@gmail.com',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor
                      ),),
                    ),
                    SizedBox(height: Get.height * 0.02,),
                    const Center(
                      child: Text('Your may click the button in the e-mail \n or enter the code manually below.',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor
                      ),textAlign: TextAlign.center,),
                    ),
                    SizedBox(height: Get.height * 0.05,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Enter Verification Code',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColor.greenTextField,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Icon(MdiIcons.chevronDown,color: AppColor.greenTextField,)
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05,),
                PinFieldAutoFill(
                  currentCode: otpCode,
                  decoration:  BoxLooseDecoration(

                      radius: const Radius.circular(5),
                      strokeColorBuilder: FixedColorBuilder(
                         AppColor.greenTextField
                      )),
                  codeLength: 6,
                  onCodeChanged: (code) {
                    print("OnCodeChanged : $code");
                    otpCode = code.toString();
                  },
                  onCodeSubmitted: (val) {
                    print("OnCodeSubmitted : $val");
                  },
                ),
                    SizedBox(height: Get.height * 0.02,),
                    const Center(
                      child: ReportRichText(title: 'f you don’t see it in Inbox, try the Junk Mail/Spam foder.Otherwise, we’ll ', des: ' resend the e-mail.',),
                    ),
                    SizedBox(height: Get.height * 0.09,),
                   RoundButton(
                        textColor:AppColor.whiteColor,
                        buttonColor:  AppColor.greenTextField,
                        width: Get.width,
                        height: Get.height * 0.06,
                        onPress: () {
                        Get.toNamed(RouteName.verifyAccount);
                        },
                        title: 'Open e-mail',
                      ),


                  ],
                )),
          ),
        )),
      );

  }
}
