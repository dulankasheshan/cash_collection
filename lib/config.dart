
import 'package:provider/provider.dart';

import 'common/session.dart';
import 'common/theme/app_theme.dart';
import 'common/theme/size_class.dart';
import 'common/theme/theme_service.dart';

export '/common/theme/index.dart';
export '/common/assets/index.dart';
export 'package:flutter/material.dart';
export '/widgets/textfield_common.dart';
export 'package:flutter/physics.dart';
import 'config.dart';

Session session = Session();
// AppFonts appFonts = AppFonts();
// NavigationClass route = NavigationClass();
// AppArray appArray = AppArray();
AppTheme get appTheme => _appTheme;
AppTheme _appTheme = AppTheme.fromType(ThemeType.light);


ThemeService appColor(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);
  return themeServices;
}


//
// getSymbol(context) {
//   final currencyData = Provider.of<CurrencyProvider>(context, listen: false).priceSymbol;
//
//   return currencyData;
// }
//
// showLoading(context) async {
//   Provider.of<LoadingProvider>(context, listen: false).showLoading();
// }
//
// hideLoading(context) async {
//   Provider.of<LoadingProvider>(context, listen: false).hideLoading();
// }
//
// String language(context, text) {
//   return AppLocalizations.of(context)!.translate(text);
// }
//
// Future<bool> isNetworkConnection() async {
//   var connectivityResult = await Connectivity().checkConnectivity(); //Check For Wifi or Mobile data is ON/OFF
//   if (connectivityResult == ConnectivityResult.none) {
//     return false;
//   } else {
//     final result = await InternetAddress.lookup('google.com'); //Check For Internet Connection
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
