import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/assets/index.dart';
import '../../../../common/theme/size_class.dart';

class LogScreenAnimation extends StatelessWidget {
  const LogScreenAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    SizeClass.updateSize(context);

    return Padding(
      padding: EdgeInsets.only(top: SizeClass.getHeight(0.08)),
      child: Center(
        child: SizedBox(
          width: SizeClass.getWidth(0.95),
          height: SizeClass.getWidth(0.95),
          child: Lottie.asset(eAnimationAssets.loginPinScreenAnimation),
        ),
      ),
    );
  }
}
