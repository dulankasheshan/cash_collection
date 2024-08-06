import 'package:flutter/material.dart';
import 'package:cash_collection/common/assets/index.dart';
import 'package:cash_collection/widgets/common_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../common/theme/size_class.dart';
import '../../../common/theme/theme_service.dart';
import '../../customer_search_screen/customer_search_screen.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const CustomerSearchScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    void navigateToCustomerSearchScreen() {
      Navigator.of(context).push(_createRoute());
    }

    return Padding(
      padding: EdgeInsets.only(
        left: SizeClass.getWidth(0.05),
        right: SizeClass.getWidth(0.05),
        bottom: SizeClass.getWidth(0.06),
      ),
      child: Row(
        children: [
          // Search box
          Expanded(
            child: GestureDetector(
              onTap: navigateToCustomerSearchScreen,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white24,
                ),
                child: Row(
                  children: [
                    SizedBox(width: SizeClass.getWidth(0.04)),
                    // Icon
                    SvgPicture.asset(
                      eSvgAssets.search,
                      color: appTheme.white,
                      width: SizeClass.getWidth(0.06),
                      height: SizeClass.getWidth(0.06),
                    ),
                    SizedBox(width: SizeClass.getWidth(0.03)),
                    Expanded(
                      child: CommonText(
                        text: 'Search Client',
                        textColor: appTheme.white,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeClass.getWidth(0.04),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: SizeClass.getWidth(0.03)),

          // Search button
          // GestureDetector(
          //   onTap: navigateToCustomerSearchScreen,
          //   child: Container(
          //     width: SizeClass.getWidth(0.15),
          //     height: 60,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       color: appTheme.gradient,
          //       boxShadow: [
          //         BoxShadow(
          //           color: appTheme.black.withOpacity(0.2),
          //           offset: Offset(0, 5),
          //           blurRadius: 10,
          //         ),
          //       ],
          //     ),
          //     child: Center(
          //       child: SvgPicture.asset(
          //         eSvgAssets.add,
          //         color: appTheme.white,
          //         width: SizeClass.getWidth(0.06),
          //         height: SizeClass.getWidth(0.06),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
