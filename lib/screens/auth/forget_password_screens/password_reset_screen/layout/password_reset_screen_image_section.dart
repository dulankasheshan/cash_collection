import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/assets/index.dart';
import '../../../../../common/theme/size_class.dart';

class PasswordResetScreenImageSection extends StatelessWidget {
  const PasswordResetScreenImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeClass.getHeight(0.1)),
      child: Center(
        child: SizedBox(
          width: SizeClass.getWidth(0.7),
          height: SizeClass.getWidth(0.7),
          child: SvgPicture.asset(eSvgAssets.resetPassword),
        ),
      ),
    );
  }
}
