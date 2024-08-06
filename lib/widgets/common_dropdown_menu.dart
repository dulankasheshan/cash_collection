import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/models/payment_methode.dart';
import '../../../common/theme/theme_service.dart';

class CommonDropdownMenu extends StatelessWidget {
  final String? selectedValue;
  final List<PaymentMethod> items;
  final void Function(String?) onChanged;
  final String labelText;
  final TextStyle? labelStyle;

  const CommonDropdownMenu({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.labelText,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    // Extract unique items and detect duplicates
    final uniqueValues = <String>{};
    final validItems = <PaymentMethod>[];

    for (var method in items) {
      if (uniqueValues.contains(method.name)) {
        print('Duplicate value detected: ${method.name}');
      } else {
        uniqueValues.add(method.name);
        validItems.add(method);
      }
    }

    // Check if selectedValue is in the validItems
    if (selectedValue != null && !validItems.any((item) => item.name == selectedValue)) {
      print('Invalid selectedValue: $selectedValue');
    }

    return DropdownButtonFormField<String>(
      value: validItems.any((item) => item.name == selectedValue) ? selectedValue : null,
      items: validItems.map((PaymentMethod method) {
        return DropdownMenuItem<String>(
          value: method.name,
          child: Row(
            children: [
              method.icon,
              const SizedBox(width: 10),
              Text(method.name),
            ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ?? TextStyle(
            fontFamily: 'Lato',
            color: appTheme.darkText),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.lightText),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.darkText),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.lightText),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select an option';
        }
        return null;
      },
    );
  }
}
