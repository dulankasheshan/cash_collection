import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/theme/theme_service.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? vertical;
  final double? horizontal;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextStyle? customStyle;

  const CommonText({
    super.key,
    required this.text,
    this.textColor,
    this.vertical,
    this.horizontal,
    this.fontSize,
    this.fontWeight,
    this.textDecoration,
    this.textAlign,
    this.customStyle,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical ?? 1.0,
        horizontal: horizontal ?? 1.0,
      ),
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.center,
        style: customStyle ?? TextStyle(
          color: textColor ?? appTheme.darkText,
          fontFamily: 'Lato',
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: textDecoration,
        ),
      ),
    );
  }
}

class LableTextStyles {
  static const TextStyle dropdownLabel = TextStyle(
    fontFamily: 'Lato',
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

}
