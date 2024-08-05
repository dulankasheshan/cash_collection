import 'package:cash_collection/screens/auth/forget_password_screens/otp_submit_screen/layout/otp_input_section.dart';
import 'package:cash_collection/screens/auth/forget_password_screens/otp_submit_screen/layout/otp_submit_message_and_title_section.dart';
import 'package:provider/provider.dart';

import '../../../../config.dart';
import 'layout/image_section.dart';

class OtpSubmitScreen extends StatefulWidget {
  const OtpSubmitScreen({super.key});

  @override
  State<OtpSubmitScreen> createState() => _OtpSubmitScreenState();
}

class _OtpSubmitScreenState extends State<OtpSubmitScreen> {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Scaffold(
      backgroundColor: appTheme.screenBg,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ImageSection(),
            OtpSubmitMessageAndTitleSection(),
            OtpInputSection()
          ],
        ),
      ),
    );
  }
}
