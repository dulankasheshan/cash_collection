import 'package:cash_collection/screens/auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/assets/index.dart';
import '../../../../../common/theme/size_class.dart';
import '../../../../../config.dart';
import '../../../../../providers/ForgotPasswordScreenProvider.dart';
import '../../../../../widgets/common_button_auth.dart';
import '../../../../../widgets/common_text.dart';
import '../../../../../widgets/textfield_common.dart';

class PasswordInputSection extends StatefulWidget {
  const PasswordInputSection({super.key});

  @override
  State<PasswordInputSection> createState() => _PasswordInputSectionState();
}

class _PasswordInputSectionState extends State<PasswordInputSection> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final forgotPasswordProvider = Provider.of<ForgotPasswordScreenProvider>(context);

    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: SizeClass.getWidth(0.05),
        vertical: SizeClass.getWidth(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CommonText(
              text: 'Reset\nPassword',
              fontWeight: FontWeight.bold,
              fontSize: SizeClass.getWidth(0.08),
              textAlign: TextAlign.left,
            ),
          ),

          SizedBox(height: SizeClass.getHeight(0.02),),

          Padding(
            padding: EdgeInsets.only(top: SizeClass.getHeight(0.03), bottom: SizeClass.getHeight(0.005)),
            child: TextFiledCommon(
              hintText: 'New password',
              imageIcon: eIconAssets.passwordIcon,
              obscureText: true,
              borderColor: appTheme.lightText,
              onChanged: (value) {
                forgotPasswordProvider.setNewPassword(value);
              },
              errorText: forgotPasswordProvider.passwordError,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: SizeClass.getHeight(0.03), bottom: SizeClass.getHeight(0.005)),
            child: TextFiledCommon(
              hintText: 'Confirm new password',
              imageIcon: eIconAssets.passwordIcon,
              obscureText: true,
              borderColor: appTheme.lightText,
              onChanged: (value) {
                forgotPasswordProvider.setConfirmPassword(value);
              },
              errorText: forgotPasswordProvider.confirmPasswordError,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top:  SizeClass.getHeight(0.05)),
            child: CommonAuthButton(
              text: 'Reset Password',
              fontWeight: FontWeight.bold,
              fontSize: SizeClass.getWidth(0.045),
              onTap: () {
                forgotPasswordProvider.submitNewPassword();
                if (forgotPasswordProvider.passwordError.isEmpty && forgotPasswordProvider.confirmPasswordError.isEmpty) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return LoginScreen();
                  }));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
