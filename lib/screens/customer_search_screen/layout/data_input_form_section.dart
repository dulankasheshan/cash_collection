import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../common/assets/index.dart';
import '../../../common/theme/size_class.dart';
import '../../../common/theme/theme_service.dart';
import '../../../providers/key_bord_visibilaty_provider.dart';
import 'data_input_form.dart';

class DataInputFormSection extends StatelessWidget {
  final String clientName;

  const DataInputFormSection({super.key, required this.clientName});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final isKeyboardVisible = Provider.of<KeyboardVisibilityProvider>(context).isKeyboardVisible;

    return Dialog(
      backgroundColor: appTheme.screenBg,
      insetPadding: EdgeInsets.symmetric(horizontal: SizeClass.getWidth(0.04),vertical:SizeClass.getWidth(0.04) ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: SizeClass.getWidth(0.05)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeClass.getWidth(0.05),

                    ),
                    child: DataInputForm(selectClientName: clientName),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          if (!isKeyboardVisible)
            Positioned(
              left: 0,
              right: 0,
              bottom: -25,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appTheme.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      eSvgAssets.close,
                      color: appTheme.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
