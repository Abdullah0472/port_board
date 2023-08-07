import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
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

// ignore: must_be_immutable
class SliderView extends StatefulWidget {
  SliderView({Key? key}) : super(key: key);

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  final signInVM = Get.put(CreateAccountViewModel());

  GlobalKey<FormState> signinformkey = GlobalKey<FormState>();
  List<Map<String, String>> images = [
    {
      'url': ImageAssets.portBoard,
      'caption':
      'The most trusted & accurate source of market capitalizations, pricing, and cryptocurrency information.',
    },
    {
      'url': ImageAssets.pic2,
      'caption':
      'The info you know and trust, in the palm of your hand.From crypto to exchange details, we’ve got it covered!',
    },
    {
      'url': ImageAssets.pic3,
      'caption':
      'See how you’re doing at any time by tracking your holdings in a simple view. Enter what you have, and watchg it go!',
    },
    {
      'url': ImageAssets.pic4,
      'caption':
      'Create an account to sync all your settings across desktop & mobile; it’s the most convenient way to stayup-to-date!',
    },
  ];
  CarouselController carouselController = CarouselController();
  int _currentSlide = 0;


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: const CustomAppBarProfile(
          title: 'Create an Account',
        ),
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [

                      CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: 600,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 2.0,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                          onPageChanged: (index, _) {
                            setState(() {
                              _currentSlide = index;
                            });
                          },
                        ),
                        items: images.map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                padding:  EdgeInsets.only(
                                    top:image['url']! == ImageAssets.portBoard ? 140.0 : 80.0,
                                    left: 15,
                                    right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      image['url']!,
                                      height: image['url']! == ImageAssets.portBoard ? 150.0 : 350.0, // Adjust the height here
                                    ),
                                     SizedBox(
                                      height: image['url']! == ImageAssets.portBoard ? 30.0 : 10.0,
                                    ),
                                    Text(

                                      image['caption']!,
                                      style: const TextStyle(
                                        fontFamily: "RobotoLight",
                                        color: AppColor.textGreyColor,
                                        fontSize: 13.0,
                                        //fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Positioned(
                        right: 15,
                        top: 10,
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              // border: Border.all(color: AppColor.textColor,width: 0),
                                color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "English",
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,

                                    ),
                                  ),
                                  Icon(MdiIcons.chevronDown,size: 25,color: Colors.grey.shade700,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        bottom: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundButton(
                              title: "Log In",
                              onPress: () {
                                Get.toNamed(RouteName.loginInView);
                              },
                              buttonColor: AppColor.darkerblue,
                              width: 120,
                            ),
                            SizedBox(width: 15,),
                            RoundButton(
                              title: "Create Account",
                              onPress: () {
                                Get.toNamed(RouteName.createAccountView);
                              },
                              buttonColor: AppColor.greenTextField,
                              width: 200,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 160,
                        bottom: 140,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: images.map((image) {
                            int index = images.indexOf(image);
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 2.0,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentSlide == index
                                    ? AppColor.greenTextField // Active dot color
                                    : Colors.grey.shade300, // Inactive dot color
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned(
                        right: 120,
                        bottom: 25,
                        child: Text(
                          'Go to HomePage',
                          style: const TextStyle(
                            color: AppColor.greyColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      );
  }
}
