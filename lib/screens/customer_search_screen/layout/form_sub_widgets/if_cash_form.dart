import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/size_class.dart';
import '../../../../common/theme/theme_service.dart';
import '../../../../providers/client_data_input_provider.dart';
import '../../../../widgets/common_form_text_field.dart';
import '../../../../widgets/common_text.dart';

class IfCashForm extends StatefulWidget {
  const IfCashForm({super.key});

  @override
  State<IfCashForm> createState() => _IfCashFormState();
}

class _IfCashFormState extends State<IfCashForm> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final provider = Provider.of<ClientDataInputProvider>(context);

    return CommonFormTextField(
      controller: _amountController,
      labelText: 'Amount',
      labelStyle: TextStyle(
        fontFamily: 'Lato',
        color: appTheme.darkText,
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an amount';
        }
        final amount = double.tryParse(value);
        if (amount == null) {
          return 'Invalid amount';
        }
        return null;
      },
      prefix: CommonText(
        text: 'Rs. ',
        textColor: appTheme.darkText,
      ),
      onChanged: (value) {
        provider.setAmount(value);
      },
    );
  }
}
