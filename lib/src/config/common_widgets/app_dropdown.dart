import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';

class AppDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String Function(T?)? itemToString;
  final void Function(T?)? onChanged;
  final String? hintText;
  final Color hintColor;
  final Color borderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isDense;
  final bool isExpanded;
  final EdgeInsetsGeometry? contentPadding;
  const AppDropdown({
    super.key,
    required this.items,
    required this.value,
    this.itemToString,
    this.onChanged,
    this.hintText,
    this.hintColor = Colors.grey,
    this.prefixIcon,
    this.suffixIcon,
    this.isDense = false,
    this.isExpanded = true,
    this.contentPadding,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isDense: true,
      value: value,
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            item.toString(),
            style: AppTextStyle.poppinsRegularText(color: Colors.black),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        fillColor: MyTheme.secondary.withOpacity(0.2),
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        isDense: isDense,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
      ),
      isExpanded: isExpanded,
    );
  }
}
