import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/constants/images_constants.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:essay_projects/src/features/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:splash_route/splash_route.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int indexPage = 0;

  PageController pageController = PageController(initialPage: 0);

  final List<Map> welcomeList = [
    {
      "image": ImageConst.welcomeImage1,
      "text": "Explore Cutting-Edge Solutions",
    },
    {
      "image": ImageConst.welcomeImage2,
      "text": "Unlock Endless Possibilities",
    },
    {
      "image": ImageConst.welcomeImage3,
      "text": "Transform Your Vision into Reality",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: PageView.builder(
                  controller: pageController,
                  itemCount: welcomeList.length,
                  onPageChanged: (i) {
                    setState(
                      () {
                        indexPage = i;
                      },
                    );
                  },
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0),
                                child: Image.asset(
                                  welcomeList[index]["image"],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                welcomeList[index]["text"],
                                textAlign: TextAlign.center,
                                style:
                                    AppTextStyle.poppinsBoldText(fontSize: 24),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "Lorem Ipsum is simply dummy text of  the printing and typesetting industry.",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.poppinsRegularText(
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      )),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (position) => Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  width: indexPage == position ? 18 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:
                          indexPage == position ? Colors.black : Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    SplashRoute(
                      targetPage: const LoginScreen(),
                      splashColor: MyTheme.primary,
                      startFractionalOffset: FractionalOffset.bottomCenter,
                      transitionDuration: const Duration(
                        milliseconds: 1500,
                      ),
                    ),
                  );

                  // context.go(AppRouteNames.login);
                },
                child: Text(
                  "SKIP",
                  style: AppTextStyle.poppinsBoldText(fontSize: 14),
                )),
          ),
          const SizedBox(height: 20),
          Container(
            height: 70,
            width: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: MyTheme.primary, width: 1),
                shape: BoxShape.circle),
            child: InkWell(
              onTap: () {
                if (indexPage != 2) {
                  pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                } else {
                  Navigator.of(context).push(
                    SplashRoute(
                      targetPage: const LoginScreen(),
                      splashColor: MyTheme.primary,
                      startFractionalOffset: FractionalOffset.bottomCenter,
                      transitionDuration: const Duration(
                        milliseconds: 1500,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyTheme.primary,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20)
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 40.0),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [],
          //   ),
          // ),
        ],
      ),
    );
  }
}
