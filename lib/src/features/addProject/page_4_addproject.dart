import 'dart:convert';

import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart';

class PageFourthAddProject extends StatefulWidget {
  const PageFourthAddProject({super.key});

  @override
  State<PageFourthAddProject> createState() => _PageFourthAddProjectState();
}

class _PageFourthAddProjectState extends State<PageFourthAddProject> {
  final ZefyrController _controller = ZefyrController();
  final FocusNode _focusNode = FocusNode();

  List<String> hint = [
    "Details Of Your Project Flow",
    "Specify All things Which going to make heart of your project",
  ];
  @override
  Widget build(BuildContext context) {
    print(jsonEncode(_controller.document.toJson()));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: AppTextStyle.poppinsSemiBoldText(fontSize: 24),
            ),
            10.kH,
            // const SizedBox(
            //   height: 10,
            // ),
            ZefyrToolbar.basic(controller: _controller),
            ZefyrField(
              minHeight: 200,

              decoration: InputDecoration(
                fillColor: MyTheme.secondary.withOpacity(0.2),
                filled: true,
                isDense: true,
                // hintText: "Manually enter your description",
                hintStyle: const TextStyle(
                    fontFamily: poppinsRegularFont,
                    fontSize: 14,
                    color: Colors.grey),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 1)),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 1)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 1)),
              ),
              // padding: const EdgeInsets.all(16),
              controller: _controller,
              focusNode: _focusNode,
            ),
            // Text(jsonEncode(_controller.document.toJson())),
            // AppTextField(
            //   maxLines: 8,
            //   onChange: () {},
            //   hintText: "Manually enter your description",
            // ),
            60.kH,
            // const SizedBox(
            //   height: 60,
            // ),
            Text(
              "Include these in your description:",
              style: AppTextStyle.poppinsMediumText(
                  fontSize: 16, color: Colors.grey),
            ),
            10.kH,
            // const SizedBox(
            //   height: 10,
            // ),
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
                  itemCount: hint.length),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
