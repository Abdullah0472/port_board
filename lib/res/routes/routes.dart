
import 'package:get/get.dart';
import 'package:port_board/view/confirm/confirm_view.dart';
import 'package:port_board/view/create_acoount/create_account_view.dart';

import 'package:port_board/view/login/login_view.dart';
import 'package:port_board/view/slider/slider_view.dart';
import 'package:port_board/view/verification_code/verification_code_view.dart';
import 'package:port_board/view/verify_account/verify_account_view.dart';

import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
    // GetPage(
    //   name: RouteName.bottomNavBar,
    //   page: () => const BottomNavigationBarView(),
    //   transitionDuration: const Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),
        GetPage(
          name: RouteName.loginInView,
          page: () =>  LoginView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteName.createAccountView,
          page: () =>  CreateAccountView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.verificationCodeView,
          page: () =>  VerificationCodeView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
    GetPage(
      name: RouteName.verifyAccount,
      page: () =>  VerifyAccountView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
        GetPage(
          name: RouteName.confirmView,
          page: () =>  ConfirmView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.sliderView,
          page: () =>  SliderView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeftWithFade,
        ),
    //
    //     GetPage(
    //       name: RouteName.connectionView,
    //       page: () =>  HistoryView(),
    //       transitionDuration: const Duration(milliseconds: 250),
    //       transition: Transition.leftToRightWithFade,
    //     ),
    // GetPage(
    //   name: RouteName.unloadedView,
    //   page: () =>  UnloadedView(),
    //   transitionDuration: const Duration(milliseconds: 250),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    // GetPage(
    //   name: RouteName.allJobVIew,
    //   page: () =>  AllJobView(),
    //   transitionDuration: const Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),
    // GetPage(
    //   name: RouteName.updatePasswordView,
    //   page: () =>  UpdatePasswordView(),
    //   transitionDuration: const Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),
    //
    // GetPage(
    //   name: RouteName.getBidView,
    //   page: () =>  GetBidView(),
    //   transitionDuration: const Duration(milliseconds: 250),
    //   transition: Transition.rightToLeftWithFade,
    // ),
    //
    // GetPage(
    //   name: RouteName.assignBidView,
    //   page: () =>  AssignBidView(),
    //   transitionDuration: const Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade,
    // ),

      ];
}
