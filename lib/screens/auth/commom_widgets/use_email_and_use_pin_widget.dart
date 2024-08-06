import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/assets/index.dart';
import '../../../common/theme/size_class.dart';
import '../../../config.dart';
import '../../../widgets/common_text.dart';
import '../login_screen/login_screen.dart';

class UseEmailAndUsePinWidget extends StatelessWidget {

  final String title;
  final String icon;
  final GestureTapCallback onTap;

  const UseEmailAndUsePinWidget({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeClass.getHeight(0.05)),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, color: appTheme.primary),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: CommonText(
                text: title,
                fontSize: SizeClass.getWidth(0.038),
                textColor: appTheme.primary,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
