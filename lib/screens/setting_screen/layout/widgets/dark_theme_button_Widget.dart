import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/size_class.dart';
import '../../../../common/theme/theme_service.dart';
import '../../../../widgets/common_text.dart';

class DarkThemeButtonWidget extends StatelessWidget {
  final String title;
  final String iconPath;

  const DarkThemeButtonWidget({
    required this.title,
    required this.iconPath,
    super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final appTheme = themeService.appTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeClass.getWidth(0.05),
        vertical: SizeClass.getWidth(0.05),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: appTheme.dividerColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                iconPath,
                height: SizeClass.getWidth(0.05),
                width: SizeClass.getWidth(0.05),
                color: appTheme.darkText,
              ),
            ),
          ),
          SizedBox(width: SizeClass.getWidth(0.04)),
          Expanded(
            child: CommonText(
              text: title,
              fontWeight: FontWeight.bold,
              textColor: appTheme.darkText,
              fontSize: SizeClass.getWidth(0.037),
              textAlign: TextAlign.left,
            ),
          ),
          // Material 3 Switch
          Switch(
            value: themeService.isDarkMode,
            onChanged: (bool value) {
              themeService.switchTheme();
            },
            thumbColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return appTheme.white;
                }
                return appTheme.white;
              },
            ),
            trackColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return appTheme.primary;
                }
                return appTheme.lightText;
              },
            ),
          ),
        ],
      ),
    );
  }
}

