import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/theme/size_class.dart';
import '../common/theme/theme_service.dart';

class CommonAuthButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? left;
  final double? bottom;
  final double? right;
  final Color? color;
  final Color? textColor;
  final String? text;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Gradient? gradient;
  final GestureTapCallback? onTap;
  final FontWeight? fontWeight;
  final double? fontSize;

  const CommonAuthButton({
    super.key,
    this.height,
    this.width,
    this.color,
    this.text,
    this.textColor,
    this.margin,
    this.borderRadius,
    this.gradient,
    this.left,
    this.right,
    this.bottom,
    this.onTap,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Container(
      height: height ?? 56,
      width: width,
      margin: margin ??
          EdgeInsets.only(
              left: left ?? 0, right: right ?? 0, bottom: bottom ?? 0),
      decoration: BoxDecoration(
        gradient: gradient ??
            LinearGradient(
              colors: [
                appTheme.gradient ?? Colors.blue, // Start color
                appTheme.primary ?? Colors.blueAccent
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        color: color,
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text ?? '',
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: fontWeight ?? FontWeight.w600,
              fontSize: fontSize ??  SizeClass.getWidth(0.045),
              fontFamily: 'Lato',
            ),
          ),
        ),
      ),
    );
  }
}
