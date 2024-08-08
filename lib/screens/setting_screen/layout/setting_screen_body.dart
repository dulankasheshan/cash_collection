import 'package:cash_collection/screens/setting_screen/layout/widgets/dark_theme_button_Widget.dart';
import 'package:cash_collection/screens/setting_screen/setting_screen_sub_pages/about_page/about_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/app_array.dart';
import '../../../common/assets/index.dart';
import '../../../common/theme/size_class.dart';
import '../../../common/theme/theme_service.dart';
import '../../../widgets/common_text.dart';
import '../setting_screen_sub_pages/account_page/account_page.dart';
import '../setting_screen_sub_pages/bug_report_page/bug_report_page.dart';
import '../setting_screen_sub_pages/change_password_page/change_password_page.dart';
import '../setting_screen_sub_pages/help_page/help_page.dart';
import '../setting_screen_sub_pages/notification_page/notification_page.dart';
import 'widgets/button_tile_widget.dart';

class SettingScreenBody extends StatefulWidget {
  const SettingScreenBody({super.key});

  @override
  State<SettingScreenBody> createState() => _SettingScreenBodyState();
}

class _SettingScreenBodyState extends State<SettingScreenBody> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    SizeClass.updateSize(context);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: appTheme.screenBg,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Fixed user details
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: SizeClass.getHeight(0.07)),
                color: appTheme.screenBg,
                child: Column(
                  children: [
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
                ),
              ),
            ),
            // Scrollable content
            Positioned(
              top: SizeClass.getHeight(0.15),
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtonTileWidget(
                        nextScreen: AccountPage(),
                        title: 'Account',
                        iconPath: eIconAssets.account),
                    ButtonTileWidget(
                        nextScreen: ChangePasswordPage(),
                        title: 'Change Password',
                        iconPath: eIconAssets.passwordIcon),
                    // ButtonTileWidget(
                    //     nextScreen: NotificationPage(),
                    //     title: 'Notification Setting',
                    //     iconPath: eIconAssets.notification),
                    //App theme change button
                    DarkThemeButtonWidget(
                        title: 'Dark Theme',
                        iconPath: eIconAssets.themeIcon),
                    // ButtonTileWidget(
                    //     nextScreen: BugReportPage(),
                    //     title: 'Report a Bug',
                    //     iconPath: eIconAssets.bug),
                    ButtonTileWidget(
                        nextScreen: HelpPage(),
                        title: 'Help',
                        iconPath: eIconAssets.help),
                    ButtonTileWidget(
                        nextScreen: AboutPage(),
                        title: 'About',
                        iconPath: eIconAssets.about),
                    ButtonTileWidget(
                        onTap: () {
                          print('log out');
                        },
                        title: 'Log Out',
                        iconPath: eIconAssets.logOut),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
