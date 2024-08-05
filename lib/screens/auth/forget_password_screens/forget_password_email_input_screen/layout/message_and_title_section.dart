import 'package:flutter/material.dart';
import 'package:cash_collection/widgets/common_text.dart';
import 'package:provider/provider.dart';
import '../../../../../common/theme/size_class.dart';
import '../../../../../config.dart';

class MessageAndTitleSection extends StatelessWidget {
  const MessageAndTitleSection({super.key});

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeClass.getWidth(0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CommonText(
              text: 'Forgot \nPassword?',
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
                text: "Don't worry! It happens. Please enter the address associated with your account.",
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
