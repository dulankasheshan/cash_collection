import 'package:cash_collection/common/assets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/theme/size_class.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeClass.getHeight(0.05)),
      child: Center(
        child: SizedBox(
          width: SizeClass.getWidth(0.8),
          height: SizeClass.getWidth(0.8),
          child: SvgPicture.asset(eSvgAssets.forgetPasswordOtp),
        ),
      ),
    );
  }
}
