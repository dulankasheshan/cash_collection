import 'package:flutter/material.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors

  bool isDark;
  Color primary;
  Color darkText;
  Color lightText;
  Color screenBg;
  Color bgColor;
  Color fieldCardBg;
  Color trans;
  Color gradient;
  Color white;
  Color gray;
  Color red;
  Color green;
  Color yellow;
  Color overlyColor;
  Color menuButtonColor;
  Color drawerHeaderColor;
  Color black;
  Color profileBorder;
  Color dividerColor;
  Color radioGrayColor;
  Color lightBGColor;
  Color chartGreen;
  Color barChartLight;
  Color cameraBgColor;
  Color blue;
  Color orange;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.primary,
    required this.darkText,
    required this.lightText,
    required this.screenBg,
    required this.bgColor,
    required this.fieldCardBg,
    required this.trans,
    required this.gradient,
    required this.white,
    required this.gray,
    required this.red,
    required this.green,
    required this.yellow,
    required this.overlyColor,
    required this.menuButtonColor,
    required this.drawerHeaderColor,
    required this.black,
    required this.profileBorder,
    required this.dividerColor,
    required this.radioGrayColor,
    required this.lightBGColor,
    required this.chartGreen,
    required this.barChartLight,
    required this.cameraBgColor,
    required this.blue,
    required this.orange,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,
          gradient: const Color(0xFF0023FF),
          primary: const Color(0xff0065FF),
          darkText: const Color(0xff17161B),
          lightText: const Color(0xff958F9F),
          screenBg: const Color.fromARGB(255, 255, 255, 255),
          fieldCardBg: const Color(0xffF5F6F7),
          trans: Colors.transparent,
          white: const Color(0xFFFFFFFF),
          gray: Colors.grey,
          red: Colors.red,
          green: Colors.green,
          overlyColor: const Color(0xFFD9D9D9),
          bgColor: const Color(0xFF17161B),
          menuButtonColor: Colors.white,
          drawerHeaderColor: const Color(0xFFF5F6F8),
          black: const Color(0xff17161B),
          profileBorder: const Color(0xFFE6E7EC),
          dividerColor: const Color.fromRGBO(159, 168, 190, 0.15),
          radioGrayColor: const Color.fromRGBO(159, 168, 190, 0.2),
          yellow: const Color(0xffFFC700),
          chartGreen: const Color.fromRGBO(17, 166, 121, 1),
          lightBGColor: const Color.fromRGBO(159, 168, 190, 0.1),
          barChartLight: const Color(0xFFE2E5EB), cameraBgColor: const Color.fromRGBO(245, 246, 248, 1),
          blue: Colors.blue,
          orange: Colors.orange,
        );

      case ThemeType.dark:
        return AppTheme(
            isDark: true,
            gradient: const Color(0xFF0023FF),
            primary: const Color(0xff0065FF),
            darkText: const Color(0xffFFFFFF),
            lightText: const Color(0xff958F9F),
            screenBg: const Color(0xFF17161B),
            fieldCardBg: const Color(0xff262935),
            trans: Colors.transparent,
            white:  const Color(0xFFFFFFFF),
            gray: Colors.grey,
            red: Colors.red,
            green: Colors.green,
            overlyColor: const Color(0xFFD9D9D9),
            bgColor: const Color(0xffFFFFFF),
            menuButtonColor: const Color(0xFF26252D),
            drawerHeaderColor: const Color(0xFF26252D),
            black: const Color(0xff17161B),
            profileBorder: const Color(0xFFE6E7EC),
            dividerColor: const Color.fromRGBO(159, 168, 190, 0.15),
            radioGrayColor: const Color.fromRGBO(159, 168, 190, 0.2),
            yellow: const Color(0xffFFC700),
            chartGreen: const Color.fromRGBO(17, 166, 121, 1),
            lightBGColor: const Color.fromRGBO(159, 168, 190, 0.1),
            barChartLight: const Color(0xFFE2E5EB),cameraBgColor: const Color(0xFF26252D),
          blue: Colors.blue,
          orange: Colors.orange,

        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        secondary: primary,
        background: screenBg,
        surface: screenBg,
        onBackground: screenBg,
        onSurface: screenBg,
        onError: Colors.red,
        onPrimary: primary,
        tertiary: screenBg,
        onInverseSurface: screenBg,
        tertiaryContainer: screenBg,
        surfaceTint: screenBg,
        surfaceVariant: screenBg,
        onSecondary: primary,
        error: Colors.red,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.transparent, cursorColor: primary),
      buttonTheme: ButtonThemeData(buttonColor: primary),
      highlightColor: primary,
    );
  }
}
