import 'package:cash_collection/common/assets/index.dart';
import 'package:cash_collection/screens/setting_screen/layout/widgets/switch_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/theme/size_class.dart';
import '../../../../../common/theme/theme_service.dart';
import '../../../../../providers/notification_Setting_provider.dart';
import '../../../../../widgets/common_text.dart';

class NotificationPageBody extends StatefulWidget {
  const NotificationPageBody({super.key});

  @override
  State<NotificationPageBody> createState() => _NotificationPageBodyState();
}

class _NotificationPageBodyState extends State<NotificationPageBody> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final settingsProvider = Provider.of<NotificationSettingsProvider>(context);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // CommonText(
              //   text: 'Notification page',
              //   textColor: appTheme.darkText,
              //   fontSize: SizeClass.getWidth(0.04),
              //   textAlign: TextAlign.left,
              // ),
              SizedBox(height: SizeClass.getHeight(0.03)),
              SwitchTileWidget(
                title: 'Push Notification',
                iconPath: eIconAssets.pushNotification,
                switchValue: settingsProvider.pushNotification,
                onSwitchChanged: (bool value) {
                  settingsProvider.pushNotification = value;
                },
              ),
              SizedBox(height: SizeClass.getHeight(0.03)),
              SwitchTileWidget(
                title: 'Email Notification',
                iconPath: eIconAssets.email,
                switchValue: settingsProvider.emailNotification,
                onSwitchChanged: (bool value) {
                  settingsProvider.emailNotification = value;
                },
              ),
              SizedBox(height: SizeClass.getHeight(0.03)),
              SwitchTileWidget(
                title: 'SMS Notification',
                iconPath: eIconAssets.sms,
                switchValue: settingsProvider.smsNotification,
                onSwitchChanged: (bool value) {
                  settingsProvider.smsNotification = value;
                },
              ),
              SizedBox(height: SizeClass.getHeight(0.03)),
              SwitchTileWidget(
                title: 'Newsletter',
                iconPath: eIconAssets.newsletter,
                switchValue: settingsProvider.newsletter,
                onSwitchChanged: (bool value) {
                  settingsProvider.newsletter = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
