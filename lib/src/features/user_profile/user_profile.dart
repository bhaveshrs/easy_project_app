import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surfaceTint.withOpacity(0.08),

      body: Column(
        children: [
          const Expanded(flex: 1, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Center(
                  child: Text("Test user",
                      style: AppTextStyle.poppinsBoldText(fontSize: 20)),
                ),
                const SizedBox(height: 16),
                const _ProfileInfoRow(),
                const SizedBox(height: 20),
                Align(alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Payment-History",
                      textAlign: TextAlign.start,
                      style: AppTextStyle.poppinsBoldText(fontSize: 18),
                    ),
                  ),
                ),
             Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
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
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Project name",
                            style:
                                AppTextStyle.poppinsMediumText(fontSize: 18),
                          ),
                          const Spacer(),
                          Text(
                            "\u{20B9} 2000",
                            style: AppTextStyle.poppinsSemiBoldText(
                                color: Colors.green, fontSize: 15),
                          )
                        ],
                      ),
                     
                      Text(
                        "check Status >",
                        style: AppTextStyle.poppinsSemiBoldText(
                            fontSize: 16, color: Colors.blue),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({super.key});

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("purchased \nproject", 1),
    ProfileInfoItem("Listed Requests", 2),
    ProfileInfoItem("chats", 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (_items.indexOf(item) != 0) const VerticalDivider(),
                    Expanded(child: _singleItem(context, item)),
                  ],
                )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [MyTheme.primary, MyTheme.primary.withOpacity(0.2)]),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: MyTheme.secondary,
                    shape: BoxShape.circle,

                    // image: DecorationImage(
                    //     fit: BoxFit.cover,
                    //     image: AssetImage(
                    //         ImageConst.verify)),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(

                          // image: DecorationImage(
                          //     fit: BoxFit.cover,
                          //     image: AssetImage(ImageConst.verify)),
                          ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
