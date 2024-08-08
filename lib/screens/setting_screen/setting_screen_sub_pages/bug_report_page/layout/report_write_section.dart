import 'package:cash_collection/common/app_array.dart';
import 'package:cash_collection/widgets/common_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../../common/theme/size_class.dart';
import '../../../../../common/theme/theme_service.dart';
import '../../../../../widgets/common_text.dart';

class ReportWriteSection extends StatefulWidget {
  const ReportWriteSection({super.key});

  @override
  State<ReportWriteSection> createState() => _ReportWriteSectionState();
}

class _ReportWriteSectionState extends State<ReportWriteSection> {
  @override
  Widget build(BuildContext context) {
    // Update the size class with the current context
    SizeClass.updateSize(context);

    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SizeClass.getWidth(0.05)),

        CommonText(
          text: 'From:',
          textColor: appTheme.lightText,
          fontSize: SizeClass.getWidth(0.04),
          textAlign: TextAlign.left,
        ),
        CommonText(
          text: AppArray().userEmail,
          textColor: appTheme.darkText,
          fontSize: SizeClass.getWidth(0.04),
          textAlign: TextAlign.left,
        ),

        SizedBox(height: SizeClass.getWidth(0.05)),

        CommonText(
          text: 'User Id:',
          textColor: appTheme.lightText,
          fontSize: SizeClass.getWidth(0.04),
          textAlign: TextAlign.left,
        ),
        CommonText(
          text: AppArray().refId,
          textColor: appTheme.darkText,
          fontSize: SizeClass.getWidth(0.04),
          textAlign: TextAlign.left,
        ),

        SizedBox(height: SizeClass.getWidth(0.05)),

        CommonText(
          text: 'What went wrong?',
          textColor: appTheme.lightText,
          fontSize: SizeClass.getWidth(0.04),
          textAlign: TextAlign.left,
        ),

        SizedBox(height: SizeClass.getHeight(0.01)),

        // Report write field
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: appTheme.lightBGColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeClass.getWidth(0.03)),
            child: TextField(
              textInputAction: TextInputAction.newline,
              cursorColor: appTheme.white,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Tell us your report...',
                hintStyle: TextStyle(
                  color: appTheme.lightText,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeClass.getWidth(0.04),
                ),
                counterStyle: TextStyle(
                  color: appTheme.lightText,
                ),
              ),
              style: TextStyle(
                color: appTheme.white,
                fontWeight: FontWeight.w600,
                fontSize: SizeClass.getWidth(0.04),
              ),
              minLines: 10,
              maxLines: null, // allows unlimited lines
              maxLength: 1500,
            ),
          ),
        ),

        SizedBox(height: SizeClass.getHeight(0.01)),

        // Attachments
        GestureDetector(
          onTap: () {
            print('Add Attachment');
          },
          child: IntrinsicWidth(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: appTheme.lightBGColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Iconsax.attach_circle_copy),
                    SizedBox(width: SizeClass.getWidth(0.02)),
                    CommonText(
                      text: 'Attach',
                      textColor: appTheme.lightText,
                      fontSize: SizeClass.getWidth(0.04),
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: SizeClass.getHeight(0.05)),

        const CommonAuthButton(text: 'Report Send',)
      ],
    );
  }
}
