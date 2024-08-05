import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/theme_service.dart';
import '../common_layout/setting_pages_common_app_bar.dart';
import 'layout/notification_page_body.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.primary,
          body: const Column(
            children: [
              SettingPagesCommonAppBar(pageName: 'Notification Setting'),
              Expanded(child: NotificationPageBody())
            ],
          ),
        )
    );
  }
}
