import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/assets/index.dart';
import '../../../../common/theme/size_class.dart';

class LogScreenImage extends StatelessWidget {
  const LogScreenImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeClass.getHeight(0.05)),
      child: Center(
        child: SizedBox(
          width: SizeClass.getWidth(0.8),
          height: SizeClass.getWidth(0.8),
          child: SvgPicture.asset(eSvgAssets.logIn),
        ),
      ),
    );
  }
}
