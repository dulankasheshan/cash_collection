import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../common/assets/index.dart';
import '../../../../common/models/payment_methode.dart';
import '../../../../common/theme/size_class.dart';
import '../../../../common/theme/theme_service.dart';
import '../../../../providers/client_data_input_provider.dart';
import '../../../../widgets/common_dropdown_menu.dart';
import '../../../../widgets/common_form_text_field.dart';
import '../../../../widgets/common_text.dart';

class CommonFormWidgets extends StatefulWidget {
  final String selectClientName;
  const CommonFormWidgets({required this.selectClientName, super.key});

  @override
  State<CommonFormWidgets> createState() => _CommonFormWidgetsState();
}

class _CommonFormWidgetsState extends State<CommonFormWidgets> {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final provider = Provider.of<ClientDataInputProvider>(context);


    final List<PaymentMethod> paymentMethods = [
      PaymentMethod(
        name: 'Cash',
        icon: SvgPicture.asset(eIconAssets.cash, width: 20, height: 20, color: appTheme.green),
      ),
      PaymentMethod(
        name: 'Bank Cheque',
        icon: SvgPicture.asset(eIconAssets.bankCheck, width: 20, height: 20, color: appTheme.blue),
      ),
      PaymentMethod(
        name: 'Bank Transfer',
        icon: SvgPicture.asset(eIconAssets.bank, width: 20, height: 20, color: appTheme.orange),
      ),
    ];


    return Column(
      children: [
        CommonText(
          text: 'Add The Collection',
          fontWeight: FontWeight.bold,
          fontSize: SizeClass.getWidth(0.05),
          textColor: appTheme.darkText,
        ),
        SizedBox(height: SizeClass.getWidth(0.1)),

        CommonFormTextField(
          labelText: 'Select Client',
          defaultValue: widget.selectClientName,
          readOnly: true,
          labelStyle: TextStyle(
            fontFamily: 'Lato',
            color: appTheme.darkText,
          ),
        ),

        SizedBox(height: SizeClass.getWidth(0.05)),
        CommonDropdownMenu(
          selectedValue: provider.clientData.paymentMethod,
          items: paymentMethods,
          onChanged: (value) {
            setState(() {
              provider.setPaymentMethod(value!);
            });
          },
          labelText: 'Select Payment Method',
        ),
      ],
    );
  }
}
