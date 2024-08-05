import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../common/theme/size_class.dart';
import '../../../../../config.dart';
import '../../../../../widgets/common_text.dart';
import '../../../../../providers/ForgotPasswordScreenProvider.dart';

class OtpSubmitMessageAndTitleSection extends StatelessWidget {
  const OtpSubmitMessageAndTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    // providers
    final provider = Provider.of<ForgotPasswordScreenProvider>(context);
    final appTheme = Provider.of<ThemeService>(context).appTheme;


    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeClass.getWidth(0.05),
        vertical: SizeClass.getWidth(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CommonText(
              text: 'Enter OTP',
              fontWeight: FontWeight.bold,
              fontSize: SizeClass.getWidth(0.08),
              textAlign: TextAlign.left,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: SizeClass.getWidth(0.08)),
              child: CommonText(
                text: "A 4 digit code has been sent to \n${provider.email}",
                fontWeight: FontWeight.normal,
                textColor: appTheme.lightText,
                fontSize: SizeClass.getWidth(0.04),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
