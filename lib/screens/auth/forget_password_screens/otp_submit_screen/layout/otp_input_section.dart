import 'package:cash_collection/screens/auth/forget_password_screens/password_reset_screen/password_reset_screen.dart';
import 'package:provider/provider.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../../../../common/theme/size_class.dart';
import '../../../../../config.dart';
import '../../../../../widgets/common_button_auth.dart';
import '../../../../../providers/ForgotPasswordScreenProvider.dart';

class OtpInputSection extends StatefulWidget {
  const OtpInputSection({super.key});

  @override
  State<OtpInputSection> createState() => _OtpInputSectionState();
}

class _OtpInputSectionState extends State<OtpInputSection> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final provider = Provider.of<ForgotPasswordScreenProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeClass.getWidth(0.05),
        vertical: SizeClass.getWidth(0.1),
      ),
      child: Column(
        children: [
          OtpPinField(
            onSubmit: (text) {
              provider.setOtp(text);
              print('Entered pin is $text');
            },
            onChange: (text) {
              print('Enter on change pin is $text');
              provider.setOtp(text);
            },
            onCodeChanged: (code) {
              print('onCodeChanged is $code');
            },
            cursorColor: appTheme.darkText,
            maxLength: 4,
            otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
            otpPinFieldStyle: OtpPinFieldStyle(
              defaultFieldBorderColor: appTheme.lightText,
              activeFieldBorderColor: appTheme.darkText,
              fieldPadding: SizeClass.getWidth(0.02),
              textStyle: TextStyle(color: appTheme.darkText,fontSize: 20, fontWeight: FontWeight.w600), // Add this line
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
            padding: EdgeInsets.only(top: SizeClass.getHeight(0.08)),
            child: CommonAuthButton(
              text: 'Submit',
              fontWeight: FontWeight.bold,
              fontSize: SizeClass.getWidth(0.045),
              onTap: () {
                bool isOtpCorrect = provider.submitOtp();
                if(isOtpCorrect){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_){
                    return const PasswordResetScreen();
                  }));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
