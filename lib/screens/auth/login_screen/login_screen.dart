import 'package:cash_collection/config.dart';
import 'package:provider/provider.dart';

import '../login_pin_check_screen/layout/login_pin_screen_animation.dart';
import 'layout/log_screen_image.dart';
import 'layout/login_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    return Scaffold(
      backgroundColor: appTheme.screenBg,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            LogScreenImage(),
            LoginSection(),
          ],
        ),
      ),
    );
  }
}
