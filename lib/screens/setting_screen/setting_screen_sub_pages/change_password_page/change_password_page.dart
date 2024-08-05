import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/theme_service.dart';
import '../common_layout/setting_pages_common_app_bar.dart';
import 'layout/password_change_page_body.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.primary,
          body: const Column(
            children: [
              SettingPagesCommonAppBar(pageName: 'Change Password'),
              Expanded(child: PasswordChangePageBody())
            ],
          ),
        )
    );
  }
}
