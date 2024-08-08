import 'package:cash_collection/common/app_array.dart';
import 'package:cash_collection/common/assets/index.dart';
import 'package:cash_collection/screens/notification_screen/notification_screen.dart';
import 'package:cash_collection/screens/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../common/theme/size_class.dart';
import '../../../common/theme/theme_service.dart';
import '../../../widgets/common_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: SizeClass.getWidth(0.05),
        vertical: SizeClass.getWidth(0.05),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //profile image
              CircleAvatar(
                backgroundColor: appTheme.lightText,
                radius: 25,
                backgroundImage: NetworkImage(AppArray().userProfileImage),
              ),

              //user name | only first and second name
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: SizeClass.getWidth(0.02),),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CommonText(
                      text: "Welcome,",
                      fontWeight: FontWeight.w500,
                      textColor: appTheme.white,
                      fontSize: SizeClass.getWidth(0.03),
                      textAlign: TextAlign.left,
                    ),
                    CommonText(
                      text: AppArray().userName,
                      fontWeight: FontWeight.bold,
                      textColor: appTheme.white,
                      fontSize: SizeClass.getWidth(0.05),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            children: [
              GestureDetector(
                onTap:  (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_){
                    return const NotificationScreen();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white24,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Badge(
                      isLabelVisible: true,
                        offset: Offset(0,0),
                        child: SvgPicture.asset(eIconAssets.notification,color: appTheme.white,)),
                  ),
                ),
              ),

              SizedBox(width: SizeClass.getWidth(0.03),),

              GestureDetector(
                onTap:  (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_){
                    return const SettingScreen();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white24,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset(eIconAssets.setting,color: appTheme.white,),
                  ),
                ),
              ),
            ],
          )

          //Setting
          // IconButton(
          //     onPressed: (){
          //       Navigator.of(context).push(MaterialPageRoute(builder: (_){
          //         return const TestScreen();
          //       }));
          //     },
          //     icon: const Icon(Icons.settings),color: appTheme.white,)
        ],
      ),
    );
  }
}
