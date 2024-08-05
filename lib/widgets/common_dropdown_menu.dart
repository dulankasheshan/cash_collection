import 'package:cash_collection/config.dart';
import 'package:provider/provider.dart';
import '../../../common/models/payment_methode.dart';

class CommonDropdownMenu extends StatelessWidget {
  final String? selectedValue;
  final List<PaymentMethod> items;
  final void Function(String?) onChanged;
  final String labelText;
  final TextStyle? labelStyle;

  const CommonDropdownMenu({super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.labelText,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: items.map((PaymentMethod method) {
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
            color: appTheme.darkText),//LableTextStyles.dropdownLabel,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.lightText),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.darkText ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.lightText),
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please select an option';
        }
        return null;
      },
    );
  }
}


// class LableTextStyles {
//   static  TextStyle dropdownLabel = TextStyle(
//     fontFamily: 'Lato',
//     color: appTheme.darkText);
// }
