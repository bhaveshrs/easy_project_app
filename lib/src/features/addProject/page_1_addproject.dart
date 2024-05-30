import 'package:essay_projects/src/config/common_widgets/app_textfild.dart';
import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';

class PageOneAddProject extends StatelessWidget {
  const PageOneAddProject({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> hint = [
      "For E-com site need React-js Developer",
      "For E-com app need Flutter developer",
      "For Data-visualization need Python developer"
    ];

    return 
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Title",
              style: AppTextStyle.poppinsSemiBoldText(fontSize: 24),
            ),
            Text(
              "Also Mention Skill",
              style: AppTextStyle.poppinsRegularText(fontSize: 12),
            ),
            10.kH,
            AppTextField(
              onChange: () {},
              hintText: "Project Title",
            ),
            60.kH,
          
            Text(
              "Example of good title",
              style: AppTextStyle.poppinsMediumText(
                  fontSize: 20, color: Colors.grey),
            ),
            10.kH,
           
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.light_mode_outlined,
                            size: 12,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            hint[index],
                            style: AppTextStyle.poppinsRegularText(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: 3),
            ),
            20.kH,
           
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.layers_outlined),
                  ),
                  Flexible(
                    child: Text(
                      "Good title helps attract better quality application",
                      style: AppTextStyle.poppinsRegularText(
                        fontSize: 15,
                      ),
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
