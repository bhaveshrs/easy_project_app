import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/constants/images_constants.dart';
import 'package:essay_projects/src/config/routes/route_name.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MarketPlaceGridTile extends StatelessWidget {
  MarketPlaceGridTile({super.key});
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
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
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(ImageConst.projectShowcase),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
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
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
            10.kH,
            Text(
              "Project-Title",
              style: AppTextStyle.poppinsSemiBoldText(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.account_balance_wallet_outlined),
                10.kW,
                Text(
                  "\u{20B9} 2000",
                  style: AppTextStyle.poppinsMediumText(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
