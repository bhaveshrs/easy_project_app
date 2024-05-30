import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/common_widgets/app_button.dart';
import 'package:essay_projects/src/config/common_widgets/app_textfild.dart';
import 'package:essay_projects/src/config/constants/app_strings.dart';
import 'package:essay_projects/src/config/routes/route_name.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  String? countryCode = "+91";

  final bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 220,
            // width: meida.width,
            decoration: const BoxDecoration(
              color: MyTheme.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "App-Logo",
                    style: AppTextStyle.poppinsBoldText(fontSize: 30),
                  )
                      // Image.asset(
                      //   ImageConst.appLogoLight,
                      //   // color: Colors.white,
                      //   width: 240,
                      // ),
                      ),
                ],
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
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Welcome to \n${AppString.appName} 👋",
                      style: AppTextStyle.poppinsSemiBoldText(fontSize: 26),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      controller: _passwordController,
                      onChange: () {},
                      hintText: "email",
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    InkWell(
                        onTap: () {},
                        child: Text(
                          "Don't have account? Create.",
                          style: AppTextStyle.poppinsMediumText(),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: AppElevatedButton(
                      text: "login",
                      onTap: () {
                        context.push(AppRouteNames.addProfile);
                      },
                      width: 200,
                      radius: 40,
                    ))
                    // Center(
                    //   child: Obx(() {
                    //     return authController.isLogin.value
                    //         ? ButtonWidget(
                    //             onPressed: () {
                    //               authController.login(
                    //                   _phoneNumberController.text,
                    //                   _passwordController.text);
                    //             },
                    //             text: "Login",
                    //             isLoading: authController.isLoading.value,
                    //           )
                    //         : ButtonWidget(
                    //             onPressed: () async {
                    //               await authController.verifyPhoneNumber(
                    //                   "$countryCode${_phoneNumberController.text}");
                    //               authController.phoneNumber.value =
                    //                   _phoneNumberController.text;
                    //             },
                    //             text: "Register",
                    //             isLoading: authController.isLoading.value,
                    //           );
                    //   }),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Center(
                    //   child: Obx(() {
                    //     return authController.isLogin.value
                    //         ? InkWell(
                    //             onTap: () {
                    //               authController.isLogin.value = false;
                    //             },
                    //             child: TextWidget.poppinsMediumText(
                    //               text: "Don't have account? Create.",
                    //             ))
                    //         : InkWell(
                    //             onTap: () {
                    //               authController.isLogin.value = true;
                    //             },
                    //             child: TextWidget.poppinsMediumText(
                    //               text: "Already have account? Login.",
                    //             ));
                    // }),
                    // )
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
