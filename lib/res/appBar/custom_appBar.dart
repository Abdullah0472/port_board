import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:port_board/res/colors/colors.dart';


class CustomAppBarProfile extends StatelessWidget
    implements PreferredSizeWidget {
  final double appBarHeight = 50;
  final String title;


  const CustomAppBarProfile({
    Key? key,
    required this.title,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(onPressed: (){}, icon: Icon(MdiIcons.menu))
      ],

      leading: IconButton(icon: Icon(MdiIcons.arrowLeft,), onPressed: () {  },),
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: AppColor.whiteColor),
    //  toolbarHeight: 200,
      backgroundColor: AppColor.darkerblue,
      elevation: 0.0,
     title: Center(
       child: Text(
         title,
         style: const TextStyle(
           color: AppColor.whiteColor,
           fontStyle: FontStyle.normal,
           decoration: TextDecoration.none,
           fontSize: 20,
           fontWeight: FontWeight.w500,
         ),
       ),
     ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
