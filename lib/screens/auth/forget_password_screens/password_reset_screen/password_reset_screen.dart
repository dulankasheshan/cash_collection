import 'package:cash_collection/screens/auth/forget_password_screens/password_reset_screen/layout/password_input_section.dart';
import 'package:cash_collection/screens/auth/forget_password_screens/password_reset_screen/layout/password_reset_screen_image_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Scaffold(
      backgroundColor: appTheme.screenBg,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            PasswordResetScreenImageSection(),
            PasswordInputSection()
          ],
        ),
      ),
    );
  }
}
