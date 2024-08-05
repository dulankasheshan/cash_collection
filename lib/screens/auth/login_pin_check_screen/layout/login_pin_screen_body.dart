import 'package:cash_collection/common/assets/index.dart';
import 'package:cash_collection/screens/auth/login_screen/login_screen.dart';
import 'package:cash_collection/screens/home_dashbord_screen/home_dashbord_screen.dart';
import 'package:cash_collection/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/size_class.dart';
import '../../../../common/theme/theme_service.dart';
import '../../../../providers/login_pin_screen_provider.dart';
import '../../../../widgets/common_button_auth.dart';

class LoginPinScreenBody extends StatefulWidget {
  const LoginPinScreenBody({super.key});

  @override
  State<LoginPinScreenBody> createState() => _LoginPinScreenBodyState();
}

class _LoginPinScreenBodyState extends State<LoginPinScreenBody> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final provider = Provider.of<LoginPinScreenProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeClass.getWidth(0.05),
        vertical: SizeClass.getWidth(0.1),
      ),
      child: Column(
        children: [
          CommonText(
            text: 'Enter Your PIN',
            fontWeight: FontWeight.bold,
            fontSize: SizeClass.getWidth(0.05),
          ),
          SizedBox(height: SizeClass.getHeight(0.05)),

          OtpPinField(
            onSubmit: (text) {
              provider.setOtp(text);
              print('Entered pin is $text');
            },
            onChange: (text) {
              provider.setOtp(text);
              print('Enter on change pin is $text');
            },
            onCodeChanged: (code) {
              print('onCodeChanged is $code');
            },
            cursorColor: appTheme.darkText,
            maxLength: 5,
            otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
            otpPinFieldStyle: OtpPinFieldStyle(
              defaultFieldBorderColor: appTheme.lightText,
              activeFieldBorderColor: appTheme.darkText,
              fieldPadding: SizeClass.getWidth(0.02),
              textStyle: TextStyle(
                color: appTheme.darkText,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          if (provider.otpError.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(bottom: SizeClass.getHeight(0.02)),
              child: Text(
                provider.otpError,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: SizeClass.getWidth(0.04),
                ),
              ),
            ),

          Padding(
            padding: EdgeInsets.only(top: SizeClass.getHeight(0.05)),
            child: CommonAuthButton(
              text: 'Login',
              fontWeight: FontWeight.bold,
              fontSize: SizeClass.getWidth(0.045),
              onTap: () {
                bool isOtpCorrect = provider.submitOtp();
                if (isOtpCorrect) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const HomeDashbordScreen();
                  }));
                }
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: SizeClass.getHeight(0.05)),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const LoginScreen();
                }));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(eIconAssets.emailIcon, color: appTheme.primary),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: CommonText(
                      text: 'Use Email',
                      fontSize: SizeClass.getWidth(0.038),
                      textColor: appTheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
