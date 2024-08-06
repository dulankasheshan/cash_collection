import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/size_class.dart';
import '../../../../common/theme/theme_service.dart';
import '../../../../providers/client_data_input_provider.dart';
import '../../../../widgets/common_form_text_field.dart';
import '../../../../widgets/common_text.dart';

class IfBankTransferForm extends StatefulWidget {
  const IfBankTransferForm({super.key});

  @override
  State<IfBankTransferForm> createState() => _IfBankTransferFormState();
}

class _IfBankTransferFormState extends State<IfBankTransferForm> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final provider = Provider.of<ClientDataInputProvider>(context);

    return Column(
      children: [
        CommonFormTextField(
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
        ),
        SizedBox(height: SizeClass.getWidth(0.05)),

        // Attachments
        GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => const ReceiptScanScreen()),
            // );
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
                      text: 'Add a Screenshot or Image',
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
      ],
    );
  }
}
