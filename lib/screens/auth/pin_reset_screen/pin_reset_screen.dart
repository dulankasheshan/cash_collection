import 'package:cash_collection/widgets/common_button_auth.dart';
import 'package:flutter/material.dart';

class PinResetScreen extends StatefulWidget {
  const PinResetScreen({super.key});

  @override
  State<PinResetScreen> createState() => _PinResetScreenState();
}

class _PinResetScreenState extends State<PinResetScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pin Reset Screen'),
            CommonAuthButton(
              text: 'Back',
              onTap: (){
              Navigator.pop(context);
            },)
          ],
        ),
      ),

    );
  }
}
