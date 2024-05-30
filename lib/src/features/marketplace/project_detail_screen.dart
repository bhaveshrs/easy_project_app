import 'package:essay_projects/src/config/common_widgets/app_bar.dart';
import 'package:essay_projects/src/config/common_widgets/app_button.dart';
import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:essay_projects/src/features/marketplace/widgets/full_screen_imageview.dart';
import 'package:flutter/material.dart';

class MarketProjectDetailsScreen extends StatefulWidget {
  const MarketProjectDetailsScreen({super.key});

  @override
  State<MarketProjectDetailsScreen> createState() =>
      _MarketProjectDetailsScreenState();
}

class _MarketProjectDetailsScreenState
    extends State<MarketProjectDetailsScreen> {
  late PageController _pageController;
  int initialIndex = 0;
  final List<String> features = [
    'Feature 1',
    'Feature 2',
    'Feature 3',
    'Feature 4',
    // Add more features here
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: initialIndex);
  }

  final List<String> projectImages = [
    'https://s3.envato.com/files/495505208/SSFile/2.jpg',
    'https://s3.envato.com/files/495505208/SSFile/1.__thumbnail.jpg',
    'https://s3.envato.com/files/495505208/SSFile/1.__thumbnail.jpg',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "About this Project"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Project Title",
                style: AppTextStyle.poppinsSemiBoldText(fontSize: 18),
              ),
              10.kH,
              Row(
                children: [
                  Text(
                    "Recently Update",
                    style: AppTextStyle.poppinsMediumText(
                        fontSize: 15, color: Colors.green),
                  ),
                  5.kW,
                  Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                      child: const Icon(
                        Icons.done,
                        size: 16,
                        color: Colors.white,
                      ))
                ],
              ),
              15.kH,
              AppElevatedButton(
                onTap: () {},
                text: "Add To Cart",
                needPrefixIcon: Icons.shopping_cart_outlined,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => FullScreenImageViewer(
                      initialIndex: 0,
                      imagePaths: projectImages,
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          // border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(projectImages.first),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            "SEE MORE IMAGES",
                            style: AppTextStyle.poppinsBoldText(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: features.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '• ',
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.55,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          features[index],
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.55,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
