import 'package:cash_collection/common/assets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../common/theme/theme_service.dart';

class TextFiledCommon extends StatefulWidget {
  final GestureTapCallback? onTap;
  final String? hintText;
  final Color? color;
  final Color? iconColor;
  final double? width;
  final String? imageIcon;
  final TextEditingController? controller;
  final TextStyle? style;
  final IconButton? icon;
  final bool? isIcon;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;
  final FormFieldSetter<String>? onSaved;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final double? borderWidth;
  final Color? borderColor;
  final BorderStyle? borderStyle;
  final String? errorText;

  const TextFiledCommon({
    super.key,
    this.onTap,
    this.hintText,
    this.color,
    this.iconColor,
    this.width,
    this.controller,
    this.style,
    this.icon,
    this.isIcon,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
    this.readOnly = false,
    this.onSaved,
    this.onChanged,
    this.imageIcon,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.contentPadding,
    this.maxLines = 1,
    this.borderWidth = 2.0,
    this.borderColor,
    this.borderStyle = BorderStyle.solid,
    this.errorText,
  });

  @override
  _TextFiledCommonState createState() => _TextFiledCommonState();
}

class _TextFiledCommonState extends State<TextFiledCommon> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeService>(context).appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (widget.imageIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  widget.imageIcon!,
                  color: widget.iconColor ?? appTheme.lightText,
                  fit: BoxFit.scaleDown,
                  height: 24,
                  width: 24,
                ),
              ),
            Expanded(
              child: TextFormField(
                onChanged: widget.onChanged,
                onSaved: widget.onSaved,
                onTap: widget.onTap,
                readOnly: widget.readOnly,
                cursorOpacityAnimates: false,
                focusNode: widget.focusNode,
                scrollPadding: EdgeInsets.zero,
                validator: widget.validator,
                keyboardType: widget.keyboardType,
                maxLength: widget.maxLength,
                controller: widget.controller,
                obscureText: _obscureText,
                minLines: 1,
                maxLines: widget.maxLines ?? 1,
                textInputAction: TextInputAction.next,
                style: widget.style ?? const TextStyle(
                  fontFamily: 'Lato',
                ),
                decoration: InputDecoration(
                  isDense: false,
                  filled: false,
                  contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: widget.borderWidth ?? 2,
                      color: widget.borderColor ?? appTheme.lightText,
                      style: widget.borderStyle ?? BorderStyle.solid,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: widget.borderWidth ?? 2,
                      color: widget.borderColor ?? appTheme.lightText,
                      style: widget.borderStyle ?? BorderStyle.solid,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: widget.borderWidth ?? 2,
                      color: widget.borderColor ?? appTheme.lightText,
                      style: widget.borderStyle ?? BorderStyle.solid,
                    ),
                  ),
                  hintText: widget.hintText,
                  prefixIcon: null,
                  suffixIcon: widget.obscureText
                      ? IconButton(
                    icon: SvgPicture.asset(
                      _obscureText
                          ? eIconAssets.eyeSlashIcon
                          : eIconAssets.eyeIcon,
                      color:  widget.iconColor ?? appTheme.lightText,
                      fit: BoxFit.scaleDown,
                      height: 24,
                      width: 24,
                    ),

                    onPressed: _togglePasswordVisibility,
                  )
                      : widget.suffixIcon,
                ),
              ),
            ),
          ],
        ),
        if (widget.errorText != null && widget.errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              widget.errorText!,
              style: const TextStyle(color: Colors.redAccent, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
