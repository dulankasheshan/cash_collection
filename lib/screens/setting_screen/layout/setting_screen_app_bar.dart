import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/theme/size_class.dart';
import '../../../common/theme/theme_service.dart';
import '../../../widgets/common_text.dart';

class SettingScreenAppBar extends StatelessWidget {
  const SettingScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Padding(
      padding: EdgeInsets.only(
        top: SizeClass.getWidth(0.05),
        left: SizeClass.getWidth(0.05),
        right: SizeClass.getWidth(0.05),
        bottom: SizeClass.getWidth(0.15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white24,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: appTheme.white,
                ),
              ),
            ),
          ),

          // Centered title
          Expanded(
            child: Center(
              child: CommonText(
                text: 'Setting',
                fontWeight: FontWeight.bold,
                textColor: appTheme.white,
                fontSize: SizeClass.getWidth(0.05),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Invisible widget
          Opacity(
            opacity: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white24,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: appTheme.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
