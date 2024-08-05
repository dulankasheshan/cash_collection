import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../common/theme/theme_service.dart';

class CommonFormTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final TextStyle? labelStyle;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Widget? prefix;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final String? defaultValue;
  final String? clientName;
  final String? clientImageUrl;

  const CommonFormTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.labelStyle,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.inputFormatters,
    this.suffixIcon,
    this.prefix,
    this.focusNode,
    this.onChanged,
    this.readOnly = false,
    this.defaultValue,
    this.clientName,
    this.clientImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    // If the controller is not provided, use a default one with the default value
    final effectiveController = controller ?? TextEditingController(text: defaultValue);

    return TextFormField(
      controller: effectiveController,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ?? TextStyle(
          fontFamily: 'Lato',
          color: appTheme.darkText,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.darkText),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.darkText),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.darkText),
        ),
        prefix: clientImageUrl != null
            ? CircleAvatar(
          radius: 20,
          backgroundColor: appTheme.lightBGColor,
          backgroundImage: NetworkImage(clientImageUrl!),
          child: clientName != null
              ? Center(
            child: Text(
              clientName![0],
              style: TextStyle(
                color: appTheme.lightText,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
              : null,
        )
            : prefix,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      validator: validator,
      onChanged: readOnly ? null : onChanged,
      readOnly: readOnly,
    );
  }
}
