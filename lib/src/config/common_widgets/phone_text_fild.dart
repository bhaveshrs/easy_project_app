import 'package:country_code_picker/country_code_picker.dart';
import 'package:essay_projects/src/config/app_theme.dart';
import 'package:flutter/material.dart';

class CountryCodePhoneTextFiled extends StatelessWidget {
  const CountryCodePhoneTextFiled(
      {super.key,
      this.onChanged,
      required this.selectedCountry,
      required this.phoneNumController});
  final Function? onChanged;
  final CountryCode selectedCountry;
  final TextEditingController phoneNumController;

  @override
  Widget build(BuildContext context) {
    print(selectedCountry);
    return Container(
      decoration: BoxDecoration(
        color: MyTheme.secondary.withOpacity(0.2),
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CountryCodePicker(
              padding: EdgeInsets.zero,
              barrierColor:Colors.white.withOpacity(0.8),
              boxDecoration: const BoxDecoration(

                  // color: AppColors.backgroundColor,
                  ),
              onChanged: (value) => onChanged?.call(value),
              initialSelection: 'IN',
              favorite: const ['+91', 'IN'],
            ),
            const VerticalDivider(
              thickness: 1.5,
            ),
            Expanded(
                flex: 5,
                child: TextField(
                  maxLength: 12,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: phoneNumController,
                  decoration: const InputDecoration(
                      counterText: '',
                      isDense: true,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: "Phone number"),
                )),
          ],
        ),
      ),
    );
  }
}
