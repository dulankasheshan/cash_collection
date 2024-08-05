import 'package:cash_collection/common/assets/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/theme/size_class.dart';
import '../../../../../common/theme/theme_service.dart';
import '../../../../../providers/password_change_page_provider.dart';
import '../../../../../widgets/common_button_auth.dart';
import '../../../../../widgets/common_text.dart';
import '../../../../../widgets/textfield_common.dart';

class PasswordChangePageBody extends StatefulWidget {
  const PasswordChangePageBody({super.key});

  @override
  State<PasswordChangePageBody> createState() => _PasswordChangePageBodyState();
}

class _PasswordChangePageBodyState extends State<PasswordChangePageBody> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final provider = Provider.of<PasswordChangePageProvider>(context);

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
                text: 'Your password must be at least 8 characters and should include a combination of numbers, letters and special characters (!@\$%)',
                textColor: appTheme.darkText,
                fontSize: SizeClass.getWidth(0.04),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: SizeClass.getHeight(0.03)),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeClass.getHeight(0.03),
                  bottom: SizeClass.getHeight(0.005),
                ),
                child: TextFiledCommon(
                  hintText: 'Current Password',
                  imageIcon: eIconAssets.passwordIcon,
                  obscureText: true,
                  borderColor: appTheme.lightText,
                  onChanged: (value) {
                    provider.setCurrentPassword(value);
                  },
                  errorText: provider.currentPasswordError,
                ),
              ),
              SizedBox(height: SizeClass.getHeight(0.03)),
              Row(
                children: [
                  CommonText(
                    text: 'New Password',
                    textColor: appTheme.dividerColor,
                  ),
                  SizedBox(width: SizeClass.getWidth(0.03)),
                  Expanded(child: Divider(color: appTheme.dividerColor)),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeClass.getHeight(0.02),
                  bottom: SizeClass.getHeight(0.005),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFiledCommon(
                      hintText: 'New Password',
                      imageIcon: eIconAssets.passwordIcon,
                      obscureText: true,
                      borderColor: appTheme.lightText,
                      onChanged: (value) {
                        provider.setNewPassword(value);
                      },
                      errorText: provider.newPasswordError,
                    ),
                    // if (provider.newPasswordError != null)
                    //   Padding(
                    //     padding: EdgeInsets.only(top: 8.0),
                    //     child: CommonText(
                    //       text: provider.newPasswordError!,
                    //       textColor: Colors.red,
                    //       fontSize: SizeClass.getWidth(0.035),
                    //       textAlign: TextAlign.left,
                    //     ),
                    //   ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeClass.getHeight(0.03),
                  bottom: SizeClass.getHeight(0.005),
                ),
                child: TextFiledCommon(
                  hintText: 'Retype New Password',
                  imageIcon: eIconAssets.passwordIcon,
                  obscureText: true,
                  borderColor: appTheme.lightText,
                  onChanged: (value) {
                    provider.setRetypeNewPassword(value);
                  },
                  errorText: provider.retypeNewPasswordError,
                ),
              ),
              SizedBox(height: SizeClass.getHeight(0.1)),
              CommonAuthButton(
                text: 'Change Password',
                onTap: () {
                  provider.submitForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
