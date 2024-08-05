import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/size_class.dart';
import '../../../../common/theme/theme_service.dart';
import '../../../../widgets/common_text.dart';

class ButtonTileWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  final Widget? nextScreen;

  const ButtonTileWidget({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
    this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final appTheme = themeService.appTheme;

    return GestureDetector(
      onTap: () {
        if (nextScreen != null) {
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => nextScreen!,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ));
        }
        if (onTap != null) {
          onTap!();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeClass.getWidth(0.05),
          vertical: SizeClass.getWidth(0.05),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: appTheme.dividerColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  iconPath,
                  height: SizeClass.getWidth(0.05),
                  width: SizeClass.getWidth(0.05),
                  color: appTheme.darkText,
                ),
              ),
            ),
            SizedBox(width: SizeClass.getWidth(0.04)),
            Expanded(
              child: CommonText(
                text: title,
                fontWeight: FontWeight.bold,
                textColor: appTheme.darkText,
                fontSize: SizeClass.getWidth(0.037),
                textAlign: TextAlign.left,
              ),
            ),
            
            Icon(Icons.keyboard_arrow_right_rounded,color: appTheme.darkText,)
          ],
        ),
      ),
    );
  }
}
