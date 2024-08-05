import 'package:cash_collection/config.dart';
import 'package:cash_collection/screens/notification_screen/layout/notification_screen_app_bar.dart';
import 'package:cash_collection/screens/notification_screen/layout/notification_screen_body_section.dart';
import 'package:provider/provider.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return  SafeArea(
        child: Scaffold(
      backgroundColor: appTheme.primary,
      body: const Column(
        children: [
          NotificationScreenAppBar(),
          Expanded(child: NotificationScreenBodySection())
        ],
      ),
    ),);
  }
}
