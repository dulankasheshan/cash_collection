import 'package:cash_collection/common/app_array.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../common/theme/size_class.dart';
import '../../../../../common/theme/theme_service.dart';
import '../../../../../widgets/common_text.dart';

class HelpPageBody extends StatefulWidget {
  const HelpPageBody({super.key});

  @override
  State<HelpPageBody> createState() => _HelpPageBodyState();
}

class _HelpPageBodyState extends State<HelpPageBody> {
  // Track the expansion state of each tile
  final Map<int, bool> _expandedState = {};

  // Method to launch a URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

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
              CommonText(
                text: 'How can \nwe help you?',
                textColor: appTheme.darkText,
                fontSize: SizeClass.getWidth(0.1),
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: SizeClass.getHeight(0.03)),
              ...AppArray().helpQuestionsAndAnswers.asMap().entries.map(
                    (entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(bottom: SizeClass.getHeight(0.02)),
                    child: ExpansionTile(
                      title: CommonText(
                        text: item.question,
                        textColor: appTheme.darkText,
                        fontSize: SizeClass.getWidth(0.05),
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                      trailing: Icon(
                        _expandedState[index] ?? false ? Icons.remove : Icons.add,
                        color: _expandedState[index] ?? false ? appTheme.primary : appTheme.darkText,
                      ),
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: appTheme.dividerColor,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeClass.getWidth(0.05),
                            vertical: SizeClass.getWidth(0.02),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: item.answer,
                                textColor: appTheme.darkText,
                                fontSize: SizeClass.getWidth(0.04),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeClass.getHeight(0.01)),
                      ],
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          _expandedState[index] = expanded;
                        });
                      },
                    ),
                  );
                },
              ).toList(),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeClass.getHeight(0.03)),
                  child: Column(
                    children: [
                      CommonText(
                        text: 'Contact Us',
                        fontSize: SizeClass.getWidth(0.05),
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: SizeClass.getHeight(0.01)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL('tel:${AppArray().contactNumber}');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: appTheme.dividerColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.call,
                                  color: appTheme.darkText,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: SizeClass.getWidth(0.03)),
                          GestureDetector(
                              onTap: () async {
                                final url = "mailto:${AppArray().contactEmail}";
                                final _uri = Uri.parse(url);

                                await launchUrl(_uri, mode: LaunchMode
                                    .externalApplication);
                              },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: appTheme.dividerColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.email,
                                  color: appTheme.darkText,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: SizeClass.getWidth(0.03)),
                          GestureDetector(
                            onTap: () async {

                              final url = AppArray().websiteLink;
                              final _uri = Uri.parse(url);

                              await launchUrl(_uri,mode: LaunchMode.externalApplication);

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: appTheme.dividerColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.public_rounded,
                                  color: appTheme.darkText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeClass.getHeight(0.03)),

                      CommonText(
                        text: '${AppArray().appVersion}v',
                        fontSize: SizeClass.getWidth(0.028),
                        textColor: appTheme.dividerColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
