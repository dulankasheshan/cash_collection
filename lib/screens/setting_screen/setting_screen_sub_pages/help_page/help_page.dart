import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/theme_service.dart';
import '../common_layout/setting_pages_common_app_bar.dart';
import 'layout/help_page_body.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.primary,
          body: const Column(
            children: [
              SettingPagesCommonAppBar(pageName: 'Help'),
              Expanded(child: HelpPageBody())
            ],
          ),
        )
    );
  }
}

