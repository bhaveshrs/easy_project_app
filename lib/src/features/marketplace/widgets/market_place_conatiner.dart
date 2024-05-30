import 'package:essay_projects/src/config/constants/images_constants.dart';
import 'package:essay_projects/src/config/routes/route_name.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MarketPlaceContainer extends StatelessWidget {
  MarketPlaceContainer({super.key});
  final List<String> tags = [
    "flutter",
    "node-js",
    "rect-js",
    "react-native",
    "wordpress"
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouteNames.marketProjectDetails);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08), // Shadow color
              // spreadRadius: 10, // Spread radius
              blurRadius: 2, // Blur radius
              offset: const Offset(0, 3), // Offset in x and y direction
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Project-Title",
                    style: AppTextStyle.poppinsSemiBoldText(fontSize: 18),
                  ),
                ),
                SizedBox(
                    height: 40,
                    width: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Image(image: AssetImage(ImageConst.designer)),
                    ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.account_balance_wallet_outlined),
                  Text(
                    "\u{20B9} 2000",
                    style: AppTextStyle.poppinsMediumText(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Frameworks Used",
              style: AppTextStyle.poppinsRegularText(fontSize: 10),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 8, // Horizontal spacing between items
              runSpacing: 8, // Vertical spacing between lines
              children: tags.map((tag) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tag,
                    style: AppTextStyle.poppinsMediumText(fontSize: 12),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
                alignment: Alignment.topRight,
                child: Text(
                  "10 - users alreday purchsed",
                  style: AppTextStyle.poppinsRegularText(fontSize: 12),
                )),
          ],
        ),
      ),
    );
  }
}
