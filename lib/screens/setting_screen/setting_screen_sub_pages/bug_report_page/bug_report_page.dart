import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/theme_service.dart';
import '../common_layout/setting_pages_common_app_bar.dart';
import 'layout/bug_report_page_body.dart';

class BugReportPage extends StatelessWidget {
  const BugReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.primary,
          body: const Column(
            children: [
              SettingPagesCommonAppBar(pageName: 'Report a Bug'),
              Expanded(child: BugReportPageBody())
            ],
          ),
        )
    );
  }
}
