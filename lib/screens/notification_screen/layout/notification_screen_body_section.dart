import 'package:cash_collection/common/app_array.dart';
import 'package:cash_collection/screens/notification_screen/layout/notification_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/theme/theme_service.dart';

class NotificationScreenBodySection extends StatefulWidget {
  const NotificationScreenBodySection({super.key});

  @override
  State<NotificationScreenBodySection> createState() => _NotificationScreenBodySectionState();
}

class _NotificationScreenBodySectionState extends State<NotificationScreenBodySection> {


  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.screenBg,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AppArray().notifications.map((notification) {
            return NotificationListTile(
              notificationTitle: notification['notificationTitle'] as String,
              notificationMessage: notification['notificationMessage'] as String,
              isRead: notification['isRead'] as bool,
              time: notification['time'] as DateTime,
            );
          }).toList(),
        ),
      ),
    );
  }
}
