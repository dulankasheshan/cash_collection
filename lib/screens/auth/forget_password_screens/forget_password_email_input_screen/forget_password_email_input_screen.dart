import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/theme_service.dart';
import 'layout/email_input_section.dart';
import 'layout/image_section.dart';
import 'layout/message_and_title_section.dart';

class ForgetPasswordEmailInputScreen extends StatefulWidget {
  const ForgetPasswordEmailInputScreen({super.key});

  @override
  State<ForgetPasswordEmailInputScreen> createState() => _ForgetPasswordEmailInputScreenState();
}

class _ForgetPasswordEmailInputScreenState extends State<ForgetPasswordEmailInputScreen> {
  @override
  Widget build(BuildContext context) {
    
    
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image
            ImageSection(),
            MessageAndTitleSection(),
            EmailInputSection()
          ],
        ),
      ),
    );
  }
}
