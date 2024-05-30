import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/common_widgets/app_bar.dart';
import 'package:essay_projects/src/config/common_widgets/app_button.dart';
import 'package:essay_projects/src/config/constants/images_constants.dart';
import 'package:essay_projects/src/config/routes/route_name.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:essay_projects/src/features/project_preview/widgets/developer_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:go_router/go_router.dart';

class ProjectPreview extends StatefulWidget {
  final bool isProfileView;
  const ProjectPreview({super.key, this.isProfileView = false});

  @override
  State<ProjectPreview> createState() => _ProjectPreviewState();
}

class _ProjectPreviewState extends State<ProjectPreview> {
  final double _currentSliderValue = 20;
  final List<String> tags = [
    "flutter",
    "node-js",
    "rect-js",
    "react-native",
    "wordpress"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
            title: widget.isProfileView ? "Preview" : "Preview & Post"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image(image: AssetImage(ImageConst.designer)),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Project-Title",
                      style: AppTextStyle.poppinsSemiBoldText(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "posted 1 hr ago",
                      style: AppTextStyle.poppinsMediumText(fontSize: 13),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "\u0024 900 - \u0024 1000 ",
                      style: AppTextStyle.poppinsMediumText(fontSize: 13),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.lock_clock_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "DeadLine is DD/MM/YYYYY ",
                      style: AppTextStyle.poppinsMediumText(fontSize: 13),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, border: Border.all()),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          height: 8,
                          width: 8,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "priority lvl is 'High' ",
                      style: AppTextStyle.poppinsMediumText(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Skill:",
                  style: AppTextStyle.poppinsMediumText(fontSize: 13),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8, // Horizontal spacing between items
                  runSpacing: 8, // Vertical spacing between lines
                  children: tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style: AppTextStyle.poppinsMediumText(fontSize: 13),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: AppTextStyle.poppinsMediumText(fontSize: 13),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum L",
                      style: AppTextStyle.poppinsMediumText(
                          fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                if (widget.isProfileView == true) ...[
                  const Divider(
                    thickness: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sort-listed Developer",
                    style: AppTextStyle.poppinsSemiBoldText(fontSize: 18),
                  ),
                  const DeveloperTile(
                    showPayStatus: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Project work status",
                        style: AppTextStyle.poppinsSemiBoldText(fontSize: 18),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.push(AppRouteNames.projectWorkStatus);
                        },
                        child: Text(
                          "Expanded View >",
                          style: AppTextStyle.poppinsSemiBoldText(
                              fontSize: 14, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  FAProgressBar(
                    currentValue: _currentSliderValue,
                    displayText: '% ',
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    progressGradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.75),
                        Colors.green.withOpacity(0.75),
                      ],
                    ),
                    animatedDuration: const Duration(milliseconds: 300),
                    direction: Axis.horizontal,
                    border: Border.all(),

                    // verticalDirection: VerticalDirection.up,
                    // formatValueFixed: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bidders",
                    style: AppTextStyle.poppinsSemiBoldText(fontSize: 18),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const DeveloperTile();
                    },
                  )
                ]
              ],
            ),
          ),
        ),
        bottomNavigationBar: !(widget.isProfileView)
            ? Padding(
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
                            onTap: () {},
                            text: "Edit",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: AppElevatedButton(
                              onTap: () {
                                context.pop();
                              },
                              text: "Post",
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : null);
  }
}
