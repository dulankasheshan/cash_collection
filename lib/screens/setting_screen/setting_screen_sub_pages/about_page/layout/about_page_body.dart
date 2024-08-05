import 'package:cash_collection/common/app_array.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/theme/size_class.dart';
import '../../../../../common/theme/theme_service.dart';
import '../../../../../widgets/common_text.dart';

class AboutPageBody extends StatelessWidget {
  const AboutPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Container(
      width: double.infinity,
      height: double.infinity,
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
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeClass.getWidth(0.05),
              vertical: SizeClass.getWidth(0.05),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  width: SizeClass.getWidth(0.5),
                  AppArray().appNameLogo,
                ),
                SizedBox(height: SizeClass.getHeight(0.02)),
                CommonText(
                  text: 'Version: ${AppArray().appVersion}v',
                  textColor: appTheme.darkText,
                  fontSize: SizeClass.getWidth(0.04),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeClass.getHeight(0.01)),
                CommonText(
                  text: 'The latest version is already installed',
                  textColor: appTheme.darkText,
                  fontSize: SizeClass.getWidth(0.04),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
