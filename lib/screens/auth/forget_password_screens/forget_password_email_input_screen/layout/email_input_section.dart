import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cash_collection/common/theme/size_class.dart';
import 'package:cash_collection/common/assets/index.dart';
import 'package:cash_collection/widgets/common_button_auth.dart';
import 'package:cash_collection/widgets/textfield_common.dart';
import '../../../../../config.dart';
import '../../../../../providers/ForgotPasswordScreenProvider.dart';
import '../../otp_submit_screen/otp_submit_screen.dart';

class EmailInputSection extends StatefulWidget {
  const EmailInputSection({super.key});

  @override
  State<EmailInputSection> createState() => _EmailInputSectionState();
}

class _EmailInputSectionState extends State<EmailInputSection> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ForgotPasswordScreenProvider>(context, listen: false);
    _emailController = TextEditingController(text: provider.email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ForgotPasswordScreenProvider>(context);
    final appTheme = Provider.of<ThemeService>(context).appTheme;


    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeClass.getWidth(0.05),
        vertical: SizeClass.getWidth(0.1),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: SizeClass.getHeight(0.015), bottom: SizeClass.getHeight(0.005)),
            child: TextFiledCommon(
              controller: _emailController,
              hintText: 'Enter email ID',
              imageIcon: eIconAssets.emailIcon,
              keyboardType: TextInputType.emailAddress,
              borderColor: appTheme.lightText,
              onChanged: (value) {
                provider.setEmail(value);
              },
              errorText: provider.emailError,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeClass.getHeight(0.05)),
            child: CommonAuthButton(
              text: 'Submit',
              fontWeight: FontWeight.bold,
              fontSize: SizeClass.getWidth(0.045),
              onTap: () {
                provider.submitEmail();
                if (provider.validateEmail()) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const OtpSubmitScreen();
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
