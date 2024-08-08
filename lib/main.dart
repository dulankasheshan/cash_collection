import 'package:cash_collection/common/app_array.dart';
import 'package:cash_collection/providers/account_page_provider.dart';
import 'package:cash_collection/providers/client_data_input_provider.dart';
import 'package:cash_collection/providers/customer_search_screen_provider.dart';
import 'package:cash_collection/providers/key_bord_visibilaty_provider.dart';
import 'package:cash_collection/providers/login_pin_screen_provider.dart';
import 'package:cash_collection/providers/notification_Setting_provider.dart';
import 'package:cash_collection/providers/password_change_page_provider.dart';
import 'package:cash_collection/screens/auth/login_pin_check_screen/login_pin_check_screen.dart';
import 'package:cash_collection/screens/auth/login_screen/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/theme/app_theme.dart';
import 'common/theme/size_class.dart';
import 'common/theme/theme_service.dart';
import 'providers/ForgotPasswordScreenProvider.dart';
import 'providers/home_page_provider.dart';
import 'providers/log_screen_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();

    // Set preferred device orientations
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Initialize AppArray
    final appArray = AppArray();

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeService(sharedPreferences)),
          ChangeNotifierProvider(create: (_) => LoginScreenProvider()),
          ChangeNotifierProvider(create: (_) => ForgotPasswordScreenProvider()),
          ChangeNotifierProvider(create: (_) => HomePageProvider()),
          ChangeNotifierProvider(create: (_) => ClientDataInputProvider()),
          ChangeNotifierProvider(
            create: (_) => CustomerSearchScreenProvider(appArray.RegisteredClients)),
          ChangeNotifierProvider(create: (_) => KeyboardVisibilityProvider()),
          ChangeNotifierProvider(create: (_) => PasswordChangePageProvider()),
          ChangeNotifierProvider(create: (_) => NotificationSettingsProvider()),
          ChangeNotifierProvider(create: (_) => AccountPageProvider()),
          ChangeNotifierProvider(create: (_) => LoginPinScreenProvider()),
        ],
        child: const MyApp(),
      ),
    );
  } catch (e) {
    // Print the error and show a message
    if (kDebugMode) {
      print('Error initializing app: $e');
    }
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ErrorPage(errorMessage: 'Failed to load app: $e'),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);

    return MaterialApp(
      title: 'Cache Collection',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.fromType(ThemeType.light).themeData,
      darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
      themeMode: themeService.theme,
      home: Builder(
        builder: (context) {
          SizeClass.updateSize(context);
          // return const LoginScreen();
          return const LoginPinCheckScreen();
        },
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  final String errorMessage;

  const ErrorPage({required this.errorMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Column(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 64,
                ),
                SizedBox(height: 16),
                Text(
                  'Oops!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Something went wrong while loading the app.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Immediately contact the service provider.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              errorMessage,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
