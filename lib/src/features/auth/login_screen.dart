import 'package:essay_projects/src/config/common_widgets/app_button.dart';
import 'package:essay_projects/src/config/common_widgets/app_textfild.dart';
import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/constants/app_strings.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:essay_projects/src/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatefulWidget {
  final Function? onTap;

  const LogInScreen({super.key, this.onTap});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          key: const ValueKey('login'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              "Welcome Back to \n${AppString.appName} 👋",
              style: AppTextStyle.poppinsSemiBoldText(fontSize: 26),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 30),
            Center(
              child: AppElevatedButton(isEnable: true,isLoading: false,
                text: "Log In",
                onTap: () {
                  if(_emailController.text.toString().trim() == "" ){
                    
                  }
                  context.read<AuthBloc>().add(LogIn(
                      email: _emailController.text.trim().toString(),
                      pass: _passwordController.text.toString().trim()));
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
                  "Don't have account? ",
                  style: AppTextStyle.poppinsMediumText(),
                ),
                GestureDetector(
                  onTap: () => widget.onTap?.call(),
                  child: Text(
                    "Create.",
                    style: AppTextStyle.poppinsMediumText(color: Colors.blue),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
