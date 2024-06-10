import 'package:essay_projects/src/config/common_widgets/app_button.dart';
import 'package:essay_projects/src/config/common_widgets/app_textfild.dart';
import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/constants/app_strings.dart';
import 'package:essay_projects/src/config/routes/route_name.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:essay_projects/src/features/auth/widgets/checkbox_zero.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  final Function? onTap;
  const RegisterScreen({super.key, this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordVisible = false;
  bool _isChecked = false;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('register'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Text(
          "Welcome to \n${AppString.appName} 👋",
          style: AppTextStyle.poppinsSemiBoldText(fontSize: 26),
        ),
        const SizedBox(height: 20),
        AppTextField(
          controller: _fullNameController,
          onChange: () {},
          hintText: "Full Name",
        ),
        const SizedBox(height: 10),
        AppTextField(
          controller: _emailController,
          onChange: () {},
          hintText: "Email",
        ),
        const SizedBox(height: 10),
        AppTextField(
          obscureText: !_isPasswordVisible,
          onSuffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              icon: Icon(_isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off)),
          controller: _passwordController,
          onChange: (val) {},
          hintText: "Password",
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NoPaddingCheckbox(
              isMarked: _isChecked,
              onChange: (val) {
                setState(() {
                  _isChecked = val;
                });
              },
            ),
            const SizedBox(width: 5),
            Flexible(
              child: RichText(
                text: TextSpan(
                  text: "I read and agree to",
                  style: AppTextStyle.poppinsSemiBoldText(color: Colors.black),
                  children: [
                    TextSpan(
                      text: " Terms and Conditions",
                      style:
                          AppTextStyle.poppinsSemiBoldText(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Center(
          child: AppElevatedButton(
            text: "Register",
            onTap: () {
              context.push(AppRouteNames.addProfile);
            },
            width: 200,
            radius: 40,
          ),
        ),
        25.kH,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already an account",
              style: AppTextStyle.poppinsMediumText(),
            ),
            GestureDetector(
              onTap: () => widget.onTap?.call(),
              child: Text(
                " log-in.",
                style: AppTextStyle.poppinsMediumText(color: Colors.blue),
              ),
            )
          ],
        ),
      ],
    );
  }
}
