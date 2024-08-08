import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../common/assets/index.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () async {
                  _showImageSourceDialog(context, provider);
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
                          text: 'Add an Image or Screenshot',
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

  void _showImageSourceDialog(BuildContext context, ClientDataInputProvider provider) {
    final appTheme = Provider.of<ThemeService>(context, listen: false).appTheme;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: appTheme.screenBg,
        title: Text('Choose image source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera, color: appTheme.darkText),
              title: CommonText(text: 'Camera', textColor: appTheme.darkText),
              onTap: () {
                provider.pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.image, color: appTheme.darkText),
              title: CommonText(text: 'Gallery', textColor: appTheme.darkText),
              onTap: () {
                provider.pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
