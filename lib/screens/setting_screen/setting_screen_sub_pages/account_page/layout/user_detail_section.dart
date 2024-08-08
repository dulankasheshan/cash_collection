import 'package:cash_collection/common/app_array.dart';
import 'package:cash_collection/config.dart';
import 'package:cash_collection/widgets/common_button_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../common/theme/size_class.dart';
import '../../../../../widgets/common_form_text_field.dart';

class UserDetailSection extends StatefulWidget {
  const UserDetailSection({super.key});

  @override
  State<UserDetailSection> createState() => _UserDetailSectionState();
}

class _UserDetailSectionState extends State<UserDetailSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonFormTextField(
          labelText: 'Ref Id',
          defaultValue: AppArray().refId,
          readOnly: true,
          labelStyle: TextStyle(
            fontFamily: 'Lato',
            color: appTheme.lightText,
          ),
        ),

        SizedBox(height: SizeClass.getWidth(0.05)),

        CommonFormTextField(
          labelText: 'User Name',
          defaultValue: AppArray().userName,
          readOnly: false,
          labelStyle: TextStyle(
            fontFamily: 'Lato',
            color: appTheme.lightText,
          ),
        ),

        SizedBox(height: SizeClass.getWidth(0.05)),

        CommonFormTextField(
          labelText: 'User Email',
          defaultValue: AppArray().userEmail,
          readOnly: true,
          labelStyle: TextStyle(
            fontFamily: 'Lato',
            color: appTheme.lightText,
          ),
        ),

        SizedBox(height: SizeClass.getWidth(0.05)),

        CommonFormTextField(
          labelText: 'Contact Number',
          defaultValue: AppArray().contactNumber,
          readOnly: false,
          labelStyle: TextStyle(
            fontFamily: 'Lato',
            color: appTheme.lightText,
          ),
        ),

        SizedBox(height: SizeClass.getWidth(0.1)),

        CommonAuthButton(
          text: 'save',
        )
      ],
    );
  }
}
