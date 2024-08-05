import 'package:cash_collection/screens/setting_screen/setting_screen_sub_pages/account_page/layout/user_detail_section.dart';
import 'package:cash_collection/screens/setting_screen/setting_screen_sub_pages/account_page/layout/user_image_and_email_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/theme/size_class.dart';
import '../../../../../common/theme/theme_service.dart';
import '../../../../../widgets/common_text.dart';


class AccountPageBody extends StatefulWidget {
  const AccountPageBody({super.key});

  @override
  State<AccountPageBody> createState() => _AccountPageBodyState();
}

class _AccountPageBodyState extends State<AccountPageBody> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.screenBg,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeClass.getWidth(0.05),
            vertical: SizeClass.getWidth(0.05),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CommonText(
              //   text: 'Account...',
              //   textColor: appTheme.darkText,
              //   fontSize: SizeClass.getWidth(0.04),
              //   textAlign: TextAlign.left,
              // ),
              SizedBox(height: SizeClass.getHeight(0.02)),
              const UserImageAndEmailSection(),
              SizedBox(height: SizeClass.getHeight(0.03)),
              UserDetailSection()

            ],
          ),
        ),
      ),
    );
  }
}
