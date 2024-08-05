import 'package:cash_collection/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/theme/theme_service.dart';

class Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}

class NotificationListTile extends StatefulWidget {
  final String notificationTitle;
  final String notificationMessage;
  final bool isRead;
  final DateTime time;
  const NotificationListTile({
    super.key,
    required this.notificationTitle,
    required this.notificationMessage,
    required this.isRead,
    required this.time,
  });

  @override
  State<NotificationListTile> createState() => _NotificationListTileState();
}

class _NotificationListTileState extends State<NotificationListTile> {
  String formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inSeconds < 60) {
      return 'now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} d';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 7).floor()} w';
    } else {
      return '${(difference.inDays / 365).floor()} y';
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (!widget.isRead) Badge(),
                        const SizedBox(width: 5),
                        CommonText(
                          text: widget.notificationTitle,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textColor: appTheme.darkText,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    CommonText(
                      text: widget.notificationMessage,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.left,
                      textColor: appTheme.darkText,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              CommonText(
                text: formatTime(widget.time),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left,
                textColor: appTheme.darkText,
              ),
            ],
          ),
          Divider(color: appTheme.dividerColor),
        ],
      ),
    );
  }
}
