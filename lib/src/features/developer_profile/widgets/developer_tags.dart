import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class DeveloperTags extends StatelessWidget {
  final String tag;
  const DeveloperTags({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset("assets/images/profile/verify.png",height: 20,width: 20,),
          5.kW,
          Text(
            tag,
            style:AppTextStyle.poppinsSemiBoldText(color: Colors.white)
          )
        ],
      ),
    );
  }
}
