import 'package:cash_collection/common/assets/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../common/app_array.dart';
import '../../../../../common/theme/size_class.dart';
import '../../../../../common/theme/theme_service.dart';
import '../../../../../widgets/common_text.dart';

class UserImageAndEmailSection extends StatefulWidget {
  const UserImageAndEmailSection({super.key});

  @override
  State<UserImageAndEmailSection> createState() => _UserImageAndEmailSectionState();
}

class _UserImageAndEmailSectionState extends State<UserImageAndEmailSection> {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: SizeClass.getWidth(0.3),
              height: SizeClass.getWidth(0.3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                border: Border.all(
                  color: appTheme.dividerColor,
                  width: SizeClass.getWidth(0.01),
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(AppArray().userProfileImage),
                onBackgroundImageError: (error, stackTrace) {
                  // Handle the error by doing nothing
                },

              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
               child: GestureDetector(
                 onTap: (){
                   if (kDebugMode) {
                     print('Change Profile Image');
                   }
                 },
                 child: Container(
                   width: 30,
                   height: 30,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(100),
                     color: appTheme.darkText,

                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: SvgPicture.asset(eIconAssets.camera,color: appTheme.screenBg,),
                   ),
                 ),
               ),
            )
          ],
        ),

        CommonText(
          text: AppArray().userName,
          fontSize: SizeClass.getWidth(0.05),
          fontWeight: FontWeight.w600,
          textColor: appTheme.darkText,
        ),
        CommonText(
          text: AppArray().refId,
          fontSize: SizeClass.getWidth(0.04),
          fontWeight: FontWeight.w600,
          textColor: appTheme.lightText,
        ),
      ],
    );
  }
}
