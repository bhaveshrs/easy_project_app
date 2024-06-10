import 'package:country_code_picker/country_code_picker.dart';
import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/common_widgets/app_dropdown.dart';
import 'package:essay_projects/src/config/common_widgets/phone_text_fild.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';

class AddProfileFirstPage extends StatefulWidget {
  const AddProfileFirstPage({super.key});

  @override
  State<AddProfileFirstPage> createState() => _AddProfileFirstPageState();
}

class _AddProfileFirstPageState extends State<AddProfileFirstPage> {
  CountryCode selectedCountry = CountryCode.fromCountryCode('IN');
  TextEditingController phoneNumController = TextEditingController();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Freelancer App",
              style: AppTextStyle.poppinsBoldText(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              'Let\'s build your profile together!',
              style: AppTextStyle.poppinsMediumText(fontSize: 17),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                height: 120,
                width: 120,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyTheme.primary,
                      ),
                      height: 100,
                      width: 100,
                      child: const Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 20,
                      child: Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 1),
                          ),
                        ], shape: BoxShape.circle, color: Colors.white),
                        height: 40,
                        width: 40,
                        child: const Icon(
                          Icons.camera_alt_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Phone number",
              style: AppTextStyle.poppinsMediumText(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            CountryCodePhoneTextFiled(
              phoneNumController: phoneNumController,
              selectedCountry: selectedCountry,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Gender",
              style: AppTextStyle.poppinsMediumText(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            AppDropdown(
                hintText: "Select gender",
                borderColor: Colors.grey,
                value: selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
                items: const [
                  'Male',
                  'Female',
                  'Non-binary',
                  'prefer not say'
                ]),
          ],
        ),
      ),
    );
  }
}
