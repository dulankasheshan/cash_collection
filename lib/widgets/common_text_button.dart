import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/theme/theme_service.dart';

class CommonTextButton extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double? vertical;
  final double? horizontal;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextStyle? customStyle;
  final VoidCallback? onTap;

  const CommonTextButton({
    super.key,
    this.text,
    this.textColor,
    this.vertical,
    this.horizontal,
    this.fontSize,
    this.fontWeight,
    this.textDecoration,
    this.customStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical ?? 1.0,
          horizontal: horizontal ?? 1.0,
        ),
        child: Text(
          text ?? '',
          textAlign: TextAlign.center,
          style: customStyle ?? TextStyle(
            color: textColor ?? appTheme.darkText,
            fontFamily: 'Lato',
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: textDecoration,

          ),
        ),
      ),
    );
  }
}
