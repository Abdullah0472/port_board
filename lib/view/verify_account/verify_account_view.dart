import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:port_board/res/appBar/custom_appBar.dart';
import 'package:port_board/res/assets/images.dart';
import 'package:port_board/res/colors/colors.dart';

class VerifyAccountView extends StatelessWidget {
  VerifyAccountView({Key? key}) : super(key: key);

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          MdiIcons.chevronLeft,
                          size: 30,
                          color: AppColor.greyColor,
                        ),
                        SizedBox(height: Get.height * 0.02,),
                        Center(
                          child:Image.asset(ImageAssets.portBoard,width: 160,height: 150,)
                        ),
                        SizedBox(height: Get.height * 0.03,),
                        const Center(
                          child: Text('Verify Your Account',style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: AppColor.blackColor
                          ),),
                        ),
                        SizedBox(height: Get.height * 0.05,),
                        const Center(
                          child: Text('You can verify by verification code:',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.greyColor
                          ),),
                        ),

                        const Center(
                          child: Text('12141',style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: AppColor.blackColor
                          ),),
                        ),
                        SizedBox(height: Get.height * 0.03,),
                        const Center(
                          child: Text('Once your account is verified, you will be able to continue with the process.',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.greyColor
                          ),textAlign: TextAlign.center,),
                        ),
                        SizedBox(height: Get.height * 0.08,),
                        const Center(
                          child: Text('Didn’t request this email? \n Your address may have been entered by mistake. Simply ignore this email and nothing further will happen. ',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.greyColor
                          ),textAlign: TextAlign.center,),
                        ),



                      ],
                    )),
              ),
            )),
      );

  }
}
