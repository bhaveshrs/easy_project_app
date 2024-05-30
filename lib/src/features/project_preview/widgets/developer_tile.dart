// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:essay_projects/src/config/routes/route_name.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeveloperTile extends StatelessWidget {
  final bool showPayStatus;
  const DeveloperTile({
    super.key,
    this.showPayStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouteNames.developerProfile);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Developer name",
                    style: AppTextStyle.poppinsMediumText(fontSize: 16),
                  ),
                  Text(
                    "Bid: \$ 950",
                    style: AppTextStyle.poppinsRegularText(fontSize: 15),
                  ),
                  if (showPayStatus)
                    Row(
                      children: [
                        Text(
                          "Payment: ",
                          style: AppTextStyle.poppinsRegularText(fontSize: 15),
                        ),
                        Text(
                          "20% Done",
                          style: AppTextStyle.poppinsRegularText(
                              fontSize: 15, color: Colors.green),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  context.push(AppRouteNames.chat);
                },
                child: Text(
                  "Say hi 👋",
                  style: AppTextStyle.poppinsBoldText(color: Colors.green),
                ))
          ],
        ),
      ),
    );
  }
}
