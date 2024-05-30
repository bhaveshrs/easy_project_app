import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/common_widgets/app_bar.dart';
import 'package:essay_projects/src/config/routes/route_name.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  final List<String> tags = [
    "Machine learning",
    "Python",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "My Idea Board"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // AddYourProject
              context.push(AppRouteNames.addProject);
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MyTheme.primary, // Your primary app color
                    MyTheme.primary.withOpacity(0.3), // Lighter shade
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Row(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32.0,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    "Put your Project for Bid",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Your Previous projects",
              style: AppTextStyle.poppinsSemiBoldText(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08), // Shadow color
                        // spreadRadius: 10, // Spread radius
                        blurRadius: 2, // Blur radius
                        offset:
                            const Offset(0, 3), // Offset in x and y direction
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "In-progress",
                        style: AppTextStyle.poppinsSemiBoldText(
                            color: Colors.green),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Project name",
                        style: AppTextStyle.poppinsMediumText(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(behavior: HitTestBehavior.translucent,
                        onTap: () {
                          context.push(AppRouteNames.projectPreview ,extra:true );
                        },
                        child: Row(
                          children: [
                            Text(
                              "check status",
                              style: AppTextStyle.poppinsMediumText(
                                  fontSize: 12, color: Colors.grey),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
