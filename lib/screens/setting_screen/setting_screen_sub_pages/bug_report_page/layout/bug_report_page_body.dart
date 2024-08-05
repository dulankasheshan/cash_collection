import 'package:cash_collection/screens/setting_screen/setting_screen_sub_pages/bug_report_page/layout/report_write_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/theme/size_class.dart';
import '../../../../../common/theme/theme_service.dart';
import '../../../../../widgets/common_text.dart';


class BugReportPageBody extends StatefulWidget {
  const BugReportPageBody({super.key});

  @override
  State<BugReportPageBody> createState() => _BugReportPageBodyState();
}

class _BugReportPageBodyState extends State<BugReportPageBody> {
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeClass.getWidth(0.05),
            vertical: SizeClass.getWidth(0.05),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReportWriteSection(),
              SizedBox(height: SizeClass.getHeight(0.03)),

            ],
          ),
        ),
      ),
    );
  }
}
