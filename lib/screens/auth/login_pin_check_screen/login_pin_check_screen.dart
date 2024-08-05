import 'package:cash_collection/screens/auth/login_pin_check_screen/layout/login_pin_screen_animation.dart';
import 'package:cash_collection/screens/auth/login_pin_check_screen/layout/login_pin_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/theme/theme_service.dart';

class LoginPinCheckScreen extends StatefulWidget {
  const LoginPinCheckScreen({super.key});

  @override
  State<LoginPinCheckScreen> createState() => _LoginPinCheckScreenState();
}

class _LoginPinCheckScreenState extends State<LoginPinCheckScreen> {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Scaffold(
      backgroundColor: appTheme.screenBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LogScreenAnimation(),
            LoginPinScreenBody()
          ],
        ),
      ),
    );
  }
}

