import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/common_widgets/app_bar.dart';
import 'package:essay_projects/src/config/common_widgets/app_button.dart';
import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/routes/route_name.dart';
import 'package:essay_projects/src/features/addProject/page_1_addproject.dart';
import 'package:essay_projects/src/features/addProject/page_2_addproject.dart';
import 'package:essay_projects/src/features/addProject/page_3_addproject.dart';
import 'package:essay_projects/src/features/addProject/page_4_addproject.dart';
import 'package:essay_projects/src/features/addProject/page_5_addproject.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:progress_stepper/progress_stepper.dart';

class AddYourProject extends StatefulWidget {
  const AddYourProject({super.key});

  @override
  State<AddYourProject> createState() => _AddYourProjectState();
}

class _AddYourProjectState extends State<AddYourProject> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.surfaceTint.withOpacity(0.08),
      appBar: const CommonAppBar(title: "Add Project"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ProgressStepper(
              width: MediaQuery.of(context).size.width,
              height: 20,
              padding: 5,
              currentStep: _currentPage + 1,
              bluntHead: false,
              bluntTail: true,
              color: Colors.grey.withOpacity(0.8),
              progressColor: MyTheme.primary,
              // labels: const <String>['A', 'B', 'C', 'D', 'E'],
              defaultTextStyle: const TextStyle(
                color: MyTheme.primary,
                fontWeight: FontWeight.w500,
              ),
              selectedTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                PageOneAddProject(), // Add your pages here
                PageSecAddProject(),
                PageThirdAddProject(),
                PageFourthAddProject(),
                PageFifthAddProject()
                // Page2(),
                // Page3(),
                // Page4(),
                // Page5(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppElevatedButton(
                    borderColor: MyTheme.primary,
                    needBorder: true,
                    onTap: () {
                      if (_currentPage > 0) {
                        _currentPage--;
                        setState(() {});
                      }
                      _pageController.animateToPage(_currentPage,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut);
                    },
                    text: "Back",
                  ),
                  5.kW,
                  // const SizedBox(
                  //   width: 5,
                  // ),
                  Expanded(
                    child: AppElevatedButton(
                      onTap: () {
                        if (_currentPage == 0) {
                          _currentPage = 1;
                          setState(() {});
                        } else if (_currentPage == 1) {
                          _currentPage = 2;
                          setState(() {});
                        } else if (_currentPage == 2) {
                          _currentPage = 3;
                          setState(() {});
                        } else if (_currentPage == 3) {
                          _currentPage = 4;
                          setState(() {});
                        } else if (_currentPage == 4) {
                          _currentPage = 5;
                          context.push(AppRouteNames.projectPreview);
                        }
                        if (_currentPage != 5) {
                          _pageController.animateToPage(_currentPage,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeInOut);
                        }
                      },
                      text: _currentPage == 0
                          ? "Next: Skill"
                          : _currentPage == 1
                              ? "Next: Wage"
                              : _currentPage == 2
                                  ? "Next: Description"
                                  : _currentPage == 3
                                      ? "Next: DeadLine"
                                      : "Preview",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
