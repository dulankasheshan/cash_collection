import 'package:cash_collection/common/assets/index.dart';
import 'package:cash_collection/screens/home_dashbord_screen/home_dashbord_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/size_class.dart';
import '../../../../common/theme/theme_service.dart';
import '../../../../providers/log_screen_provider.dart';
import '../../../../widgets/common_button_auth.dart';
import '../../../../widgets/common_text.dart';
import '../../../../widgets/common_text_button.dart';
import '../../../../widgets/textfield_common.dart';
import '../../forget_password_screens/forget_password_email_input_screen/forget_password_email_input_screen.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  @override
  Widget build(BuildContext context) {
    SizeClass.updateSize(context); // Ensure SizeClass is updated with current context

    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final loginProvider = Provider.of<LoginScreenProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeClass.getWidth(0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: SizeClass.getHeight(0.02)),
            child: const CommonText(
              //Title text
              text: 'Login',
              fontWeight: FontWeight.bold,
              fontSize: 28.0, // Fixed size to avoid recalculations
            ),
          ),
          // Email ID
          Padding(
            padding: EdgeInsets.only(top: SizeClass.getHeight(0.015), bottom: SizeClass.getHeight(0.005)),
            child: TextFiledCommon(
              hintText: 'Enter email ID',
              imageIcon: eIconAssets.emailIcon,
              keyboardType: TextInputType.emailAddress,
              borderColor: appTheme.lightText,
              onChanged: (value) {
                loginProvider.setEmail(value);
              },
              errorText: loginProvider.emailError,
            ),
          ),
          // Password
          Padding(
            padding: EdgeInsets.only(top: SizeClass.getHeight(0.03), bottom: SizeClass.getHeight(0.005)),
            child: TextFiledCommon(
              hintText: 'Enter password',
              imageIcon: eIconAssets.passwordIcon,
              obscureText: true,
              borderColor: appTheme.lightText,
              onChanged: (value) {
                loginProvider.setPassword(value);
              },
              errorText: loginProvider.passwordError,
            ),
          ),
          // Forget password
          Padding(
            padding: EdgeInsets.only(top: SizeClass.getHeight(0.02)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonTextButton(
                  text: 'Forgot Password?',
                  fontWeight: FontWeight.w600,
                  textColor: appTheme.primary,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const ForgetPasswordEmailInputScreen();
                    }));
                    if (kDebugMode) {
                      print('Click forgot password button');
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: SizeClass.getHeight(0.05)),
            child: CommonAuthButton(
              text: 'Login',
              fontWeight: FontWeight.bold,
              fontSize: SizeClass.getWidth(0.045),
              onTap: () {
                loginProvider.login();
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const HomeDashbordScreen();
                }));
              },
            ),
          )
        ],
      ),
    );
  }
}
