import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextInputAction? textInputAction;
  final String? hintText;
  final Color hintColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Function? onChange;
  final Widget? prefixIcon;
  final Function? onSuffixIconPress;
  final Widget? onSuffixIcon;
  final Function? onTap;
  final Function? onValidator;
  final int? maxLength;
  final int? maxLines;
  final bool obscureText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  const AppTextField(
      {super.key,
      this.textInputAction,
      this.textCapitalization,
      this.inputFormatters,
      this.hintText,
      this.hintColor = Colors.grey,
      this.fontSize = 12,
      this.fontWeight = FontWeight.w500,
      this.controller,
      required this.onChange,
      this.onValidator,
      this.prefixIcon,
      this.maxLength,
      this.onSuffixIconPress,
      this.onSuffixIcon,
      this.obscureText = false,
      this.readOnly = false,
      this.contentPadding,
      this.onTap,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: readOnly,
        onTap: () => onTap?.call(),
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        controller: controller,
        obscureText: obscureText,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) => onChange?.call(value),
        validator: (value) => onValidator?.call(value),
        decoration: InputDecoration(
          contentPadding: contentPadding,
          fillColor: MyTheme.secondary.withOpacity(0.2),
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: onSuffixIcon,
          isDense: true,
          hintText: hintText,
          errorStyle: TextStyle(
              color: MyTheme.danger,
              fontSize: fontSize,
              fontFamily: poppinsRegularFont,
              fontWeight: fontWeight),
          hintStyle: const TextStyle(
              fontFamily: poppinsRegularFont, fontSize: 14, color: Colors.grey),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Colors.grey, width: 1)),
        ));
  }
}
     
                        