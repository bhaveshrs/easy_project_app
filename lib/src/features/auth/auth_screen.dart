import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/constants/app_strings.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:essay_projects/src/features/auth/login_screen.dart';
import 'package:essay_projects/src/features/auth/register_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoginMode = true;

  void _toggleAuthMode() {
    setState(() {
      _isLoginMode = !_isLoginMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(
              color: MyTheme.primary,
            ),
            child: Center(
              child: Text(
                "App-Logo",
                style: AppTextStyle.poppinsBoldText(fontSize: 30),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 192.0, bottom: 30.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    AnimatedSwitcher(
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      duration: const Duration(milliseconds: 300),
                      child: _isLoginMode
                          ?  LogInScreen(onTap: _toggleAuthMode,)
                          :  RegisterScreen(onTap: _toggleAuthMode,),
                    ),
                    // const SizedBox(height: 25),
                    // Center(
                    //   child: GestureDetector(
                    //     onTap: _toggleAuthMode,
                    //     child: Text(
                    //       _isLoginMode
                    //           ? "Don't have an account? Register"
                    //           : "Already have an account? Log In",
                    //       style: AppTextStyle.poppinsMediumText(
                    //           color: Colors.blue),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoPaddingCheckbox extends StatelessWidget {
  final bool isMarked;
  final Function(bool) onChange;
  final double size;

  const NoPaddingCheckbox({
    super.key,
    required this.isMarked,
    required this.onChange,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size, maxWidth: size),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Icon(
          _getIconData(),
          size: size,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () => onChange(!isMarked),
      ),
    );
  }

  IconData _getIconData() {
    return isMarked ? Icons.check_box : Icons.check_box_outline_blank;
  }
}
