import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/client_data_input_provider.dart';

import '../../../../common/theme/size_class.dart';
import '../../../../common/theme/theme_service.dart';
import '../../../providers/key_bord_visibilaty_provider.dart';
import '../../../widgets/common_button_auth.dart';
import 'form_sub_widgets/common_form_widgets.dart';
import 'form_sub_widgets/if_bank_cheque_form.dart';
import 'form_sub_widgets/if_bank_transfer_form.dart';
import 'form_sub_widgets/if_cash_form.dart';

class DataInputForm extends StatefulWidget {
  final String selectClientName;
  const DataInputForm({required this.selectClientName, super.key});

  @override
  State<DataInputForm> createState() => _DataInputFormState();
}

class _DataInputFormState extends State<DataInputForm> with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClientDataInputProvider>(context, listen: false).setPaymentMethod('Cash');
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    // Ensure the widget is still mounted before using context
    if (mounted) {
      final isVisible = WidgetsBinding.instance.window.viewInsets.bottom > 0;
      Provider.of<KeyboardVisibilityProvider>(context, listen: false).updateKeyboardVisibility(isVisible);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClientDataInputProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonFormWidgets(selectClientName: widget.selectClientName),

          SizedBox(height: SizeClass.getWidth(0.05)),
          if (provider.clientData.paymentMethod == 'Cash')
            const IfCashForm(),

          if (provider.clientData.paymentMethod == 'Bank Check')
            const IfBankChequeForm(),

          if (provider.clientData.paymentMethod == 'Bank Transfer')
            const IfBankTransferForm(),

          SizedBox(height: SizeClass.getWidth(0.05)),
          CommonAuthButton(
            text: 'Add Collection',
            fontWeight: FontWeight.bold,
            fontSize: SizeClass.getWidth(0.045),
            onTap: () {
              if (_formKey.currentState?.validate() ?? false) {
                provider.submitData();
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
