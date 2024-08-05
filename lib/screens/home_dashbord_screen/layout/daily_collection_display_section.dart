import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../common/theme/size_class.dart';
import '../../../config.dart';
import '../../../providers/home_page_provider.dart';
import '../../../widgets/common_text.dart';

class DailyCollectionDisplaySection extends StatefulWidget {
  const DailyCollectionDisplaySection({super.key});

  @override
  State<DailyCollectionDisplaySection> createState() => _DailyCollectionDisplaySectionState();
}

class _DailyCollectionDisplaySectionState extends State<DailyCollectionDisplaySection> {
  String formatAmount(String amount) {
    if (amount.isEmpty) {
      return '0.00';
    }

    // Convert the amount to a double and format it with commas
    double parsedAmount = double.tryParse(amount) ?? 0.0;
    final formatter = NumberFormat('#,##0.00', 'en_US');
    String formattedAmount = formatter.format(parsedAmount);

    return formattedAmount;
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final dailyCollectAmount = context.watch<HomePageProvider>().dailyCollectAmount;
    final formattedAmount = formatAmount(dailyCollectAmount);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeClass.getWidth(0.05),
        vertical: SizeClass.getWidth(0.07),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonText(
            text: 'Daily Collection',
            fontWeight: FontWeight.w500,
            textColor: appTheme.white,
            fontSize: SizeClass.getWidth(0.04),
            textAlign: TextAlign.left,
          ),
          // Daily amount display
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: RichText(
                text: TextSpan(
                  text: 'Rs.',
                  style: TextStyle(
                    fontSize: SizeClass.getWidth(0.13),
                    fontWeight: FontWeight.bold,
                    color: appTheme.white,
                  ),
                  children: [
                    TextSpan(
                      text: formattedAmount.split('.')[0],
                      style: TextStyle(
                        fontSize: SizeClass.getWidth(0.13),
                        fontWeight: FontWeight.bold,
                        color: appTheme.white,
                      ),
                    ),
                    TextSpan(
                      text: '.${formattedAmount.split('.')[1]}',
                      style: TextStyle(
                        fontSize: SizeClass.getWidth(0.08),
                        fontWeight: FontWeight.bold,
                        color: appTheme.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
