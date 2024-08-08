import 'dart:io';

import 'package:cash_collection/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/app_array.dart';
import '../../../../common/theme/size_class.dart';
import '../../../../common/theme/theme_service.dart';
import '../../../../providers/client_data_input_provider.dart';
import '../../../../widgets/common_form_text_field.dart';
import '../../../../widgets/common_text.dart';

class IfBankChequeForm extends StatefulWidget {
  const IfBankChequeForm({super.key});

  @override
  State<IfBankChequeForm> createState() => _IfBankChequeFormState();
}

class _IfBankChequeFormState extends State<IfBankChequeForm> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _checkNumberController = TextEditingController();
  final TextEditingController _checkDateController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;
    final provider = Provider.of<ClientDataInputProvider>(context);

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
          _checkDateController.text =
              DateFormat('yyyy-MM-dd').format(selectedDate);
          Provider.of<ClientDataInputProvider>(context, listen: false)
              .setCheckDate(DateFormat('yyyy-MM-dd').format(selectedDate));
        });
      }
    }

    return Column(
      children: [
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return AppArray().bankNames.where((String bank) {
              return bank
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selectedBank) {
            _bankNameController.text = selectedBank;
            provider.setBankName(selectedBank);
          },
          fieldViewBuilder: (BuildContext context,
              TextEditingController fieldTextEditingController,
              FocusNode fieldFocusNode,
              VoidCallback onFieldSubmitted) {
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
                if (!AppArray().bankNames.contains(value)) {
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
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(eIconAssets.calender,
                    color: appTheme.lightText),
              ),
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
        SizedBox(height: SizeClass.getHeight(0.02)),

        //Attachment
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Flexible(
              child: GestureDetector(
                onTap: () async {
                  await provider.pickImage(ImageSource.camera);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: appTheme.lightBGColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          eIconAssets.attachment,
                          color: appTheme.lightText,
                          width: SizeClass.getWidth(0.05),
                        ),
                        SizedBox(width: SizeClass.getWidth(0.02)),

                        CommonText(
                          text: 'Add a Image',
                          textColor: appTheme.lightText,
                          fontSize: SizeClass.getWidth(0.04),
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.left,
                        ),
                        if (provider.isSubmitted && provider.imagePath == null)
                          const Text(
                            '*',
                            style: TextStyle(color: Colors.red),
                          ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (provider.imagePath != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(
                  File(provider.imagePath!),
                  width: SizeClass.getWidth(0.1),
                  height: SizeClass.getHeight(0.05),
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),

      ],
    );
  }
}
