import 'package:cash_collection/common/app_array.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../common/models/payment_methode.dart';
import '../../../common/theme/size_class.dart';
import '../../../providers/client_data_input_provider.dart';
import '../../../providers/key_bord_visibilaty_provider.dart';
import '../../../widgets/common_dropdown_menu.dart';
import '../../../widgets/common_form_text_field.dart';
import '../../../widgets/common_text.dart';
import '../../../config.dart';
import '../../../widgets/common_button_auth.dart';

class DataInputForm extends StatefulWidget {
  final String selectClientName;
  const DataInputForm({required this.selectClientName, Key? key}) : super(key: key);

  @override
  State<DataInputForm> createState() => _DataInputFormState();
}

class _DataInputFormState extends State<DataInputForm> with WidgetsBindingObserver {
  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      name: 'Cash',
      icon: SvgPicture.asset(eSvgAssets.cash, width: 20, height: 20, color: appTheme.green),
    ),
    PaymentMethod(
      name: 'Bank Check',
      icon: SvgPicture.asset(eSvgAssets.bankCheck, width: 20, height: 20, color: appTheme.blue),
    ),
    PaymentMethod(
      name: 'Bank Transfer',
      icon: SvgPicture.asset(eSvgAssets.bank, width: 20, height: 20, color: appTheme.orange),
    ),
  ];

  String _selectedPaymentMethod = 'Cash';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _checkNumberController = TextEditingController();
  final TextEditingController _checkDateController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final String _refId = AppArray().userId; // refId
  final String _clientId = '4321'; // clientId
  final List<String> bankNames = [
    'Bank of Ceylon (BOC)',
    'People\'s Bank',
    'Commercial Bank of Ceylon',
    'Hatton National Bank (HNB)',
    'Sampath Bank',
    'Seylan Bank',
    'Nations Trust Bank (NTB)',
    'Pan Asia Bank',
    'Amana Bank',
    'Cargills Bank',
    'Citibank',
    'Deutsche Bank',
    'DFCC Bank',
    'Habib Bank',
    'Indian Bank',
    'Indian Overseas Bank',
    'MCB Bank',
    'National Development Bank (NDB)',
    'Public Bank Berhad',
    'Standard Chartered Bank',
    'State Bank of India',
    'The Hongkong and Shanghai Banking Corporation (HSBC)',
    'Union Bank of Colombo',
    'Housing Development Finance Corporation (HDFC)',
    'National Savings Bank (NSB)',
    'Regional Development Bank (Pradheshiya Sanwardhana Bank)',
    'Sanasa Development Bank',
    'Sri Lanka Savings Bank',
    'Lanka Orix Finance',
    'LB Finance',
    'ICICI Bank',
    'Shinhan Bank',
    'China Construction Bank',
    'Bank of China',
    'DBS Bank',
    'Uteem Bank',
    'JPMorgan Chase',
    'Royal Bank of Scotland',
    'Westpac',
    'BNP Paribas',
    'Macquarie Bank',
    'Citibank N.A.',
    'Standard Bank',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClientDataInputProvider>(context, listen: false).setPaymentMethod(_selectedPaymentMethod);
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final isVisible = WidgetsBinding.instance.window.viewInsets.bottom > 0;
    Provider.of<KeyboardVisibilityProvider>(context, listen: false).updateKeyboardVisibility(isVisible);
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: appTheme.primary),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: appTheme.primary,
              ),
            ),
            datePickerTheme: DatePickerThemeData(
              headerBackgroundColor: appTheme.primary,
              backgroundColor: appTheme.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (selectedDate != null) {
      setState(() {
        _checkDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
        Provider.of<ClientDataInputProvider>(context, listen: false).setCheckDate(DateFormat('yyyy-MM-dd').format(selectedDate));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final provider = Provider.of<ClientDataInputProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
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
            selectedValue: _selectedPaymentMethod,
            items: paymentMethods,
            onChanged: (value) {
              setState(() {
                _selectedPaymentMethod = value!;
                provider.setPaymentMethod(value!);
              });
            },
            labelText: 'Select Payment Method',
          ),
          SizedBox(height: SizeClass.getWidth(0.05)),
          if (_selectedPaymentMethod == 'Cash')
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
          if (_selectedPaymentMethod == 'Bank Check')
            Column(
              children: [
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return bankNames.where((String bank) {
                      return bank.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selectedBank) {
                    _bankNameController.text = selectedBank;
                    provider.setBankName(selectedBank);
                  },
                  fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                    _bankNameController.text = fieldTextEditingController.text;
                    return CommonFormTextField(
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      labelText: 'Bank Name',
                      labelStyle: TextStyle(
                        fontFamily: 'Lato',
                        color: appTheme.darkText,
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the bank name';
                        }
                        if (!bankNames.contains(value)) {
                          return 'Please select a valid bank name';
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(height: SizeClass.getWidth(0.05)),
                CommonFormTextField(
                  controller: _checkNumberController,
                  labelText: 'Check Number',
                  labelStyle: TextStyle(
                    fontFamily: 'Lato',
                    color: appTheme.darkText,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the check number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    provider.setCheckNumber(value);
                  },
                ),
                SizedBox(height: SizeClass.getWidth(0.05)),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: CommonFormTextField(
                      controller: _checkDateController,
                      labelText: 'Check Realization Date',
                      labelStyle: TextStyle(
                        fontFamily: 'Lato',
                        color: appTheme.darkText,
                      ),
                      keyboardType: TextInputType.datetime,
                      suffixIcon: Icon(Icons.calendar_today, color: appTheme.darkText),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the check realization date';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        provider.setCheckDate(value);
                      },
                    ),
                  ),
                ),
                SizedBox(height: SizeClass.getWidth(0.05)),
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
              ],
            ),
          if (_selectedPaymentMethod == 'Bank Transfer')
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
          SizedBox(height: SizeClass.getWidth(0.1)),
          CommonAuthButton(
            text: 'Add Collection',
            fontWeight: FontWeight.bold,
            fontSize: SizeClass.getWidth(0.045),
            onTap: () {
              if (_formKey.currentState?.validate() ?? false) {
                provider.setRefId(_refId);
                provider.setClientId(_clientId);
                provider.submitData();

                // Clear form values and reset to default state
                _amountController.clear();
                _checkNumberController.clear();
                _checkDateController.clear();
                _bankNameController.clear();
                setState(() {
                  _selectedPaymentMethod = 'Cash';
                });
                provider.setPaymentMethod('Cash');
                Navigator.of(context).pop();
              }
            },
          ),

        ],
      ),
    );
  }
}
