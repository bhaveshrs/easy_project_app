import 'package:essay_projects/src/config/common_widgets/app_textfild.dart';
import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddSocialLinks extends StatefulWidget {
  const AddSocialLinks({super.key});

  @override
  State<AddSocialLinks> createState() => _AddSocialLinksState();
}

class _AddSocialLinksState extends State<AddSocialLinks> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Social links",
              style: AppTextStyle.poppinsBoldText(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              'So people can get to know you better.',
              style: AppTextStyle.poppinsMediumText(fontSize: 17),
            ),
            20.kH,
            Text(
              "Add links",
              style: AppTextStyle.poppinsRegularText(fontSize: 20),
            ),
            10.kH,
            AppTextField(hintText: "eg: https://www.facebook.com/xyz",
              onChange: () {},
              prefixIcon: SizedBox(
                  height: 10,
                  width: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        SvgPicture.asset("assets/images/profile/facebook.svg"),
                  )),
            ),
            10.kH,
            AppTextField(
              hintText: "eg: https://www.instagram.com/",
              onChange: () {},
              prefixIcon: SizedBox(
                  height: 10,
                  width: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        SvgPicture.asset("assets/images/profile/instagram.svg"),
                  )),
            ),
            10.kH,
            AppTextField(
              hintText: "eg: https://www.linkedin.com/in/XYZ-name/",
              onChange: () {},
              prefixIcon: SizedBox(
                  height: 10,
                  width: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        SvgPicture.asset("assets/images/profile/linkedin.svg"),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
