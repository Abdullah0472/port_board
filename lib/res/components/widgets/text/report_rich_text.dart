import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class ReportRichText extends StatelessWidget {
  final String title;
  final String des;
  const ReportRichText({Key? key, required this.title, required this.des}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: RichText(
        text:  TextSpan(
            text: title,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColor.greyColor
            ),
            children: <TextSpan>[
              TextSpan(
                text: des,
                style:  TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greenTextField
                ),
              ),
            ]),
      ),
    );
  }
}
