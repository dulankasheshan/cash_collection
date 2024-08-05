import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/theme/theme_service.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final appTheme = themeService.appTheme;

    return Scaffold(
      backgroundColor: appTheme.screenBg,
      appBar: AppBar(
        title: const Text('Test Screen'),
        backgroundColor: appTheme.primary,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            themeService.switchTheme();
          },
          style: ElevatedButton.styleFrom(
            //primary: appTheme.primary, // Button color
          ),
          child: Text(themeService.isDarkMode ? 'Switch to Light Theme' : 'Switch to Dark Theme'),
        ),
      ),
    );
  }
}
