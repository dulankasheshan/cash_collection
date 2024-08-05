import 'package:cash_collection/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app_array.dart';
import '../../common/theme/theme_service.dart';
import '../../common/theme/size_class.dart'; // Import SizeClass
import 'layout/setting_screen_app_bar.dart';
import 'layout/setting_screen_body.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeClass.updateSize(context);

    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.primary,
        body: Stack(
          children: [
            const Column(
              children: [
                SettingScreenAppBar(),
                SizedBox(height: 40),
                Expanded(child: SettingScreenBody()),
              ],
            ),
            Positioned(
              top: SizeClass.getHeight(0.1),
              left: SizeClass.getWidth(0.5) - SizeClass.getWidth(0.15),
              child: Column(
                children: [
                  Container(
                    width: SizeClass.getWidth(0.3),
                    height: SizeClass.getWidth(0.3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: appTheme.screenBg,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
