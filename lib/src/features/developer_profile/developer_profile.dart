import 'package:essay_projects/src/config/common_widgets/app_button.dart';
import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:essay_projects/src/features/developer_profile/widgets/developer_tags.dart';
import 'package:flutter/material.dart';

class DeveloperProfile extends StatefulWidget {
  const DeveloperProfile({super.key});

  @override
  State<DeveloperProfile> createState() => _DeveloperProfileState();
}

class _DeveloperProfileState extends State<DeveloperProfile> {
  final DeveloperProfileModel developer = DeveloperProfileModel(
    name: "John Doe",
    profilePhoto: "assets/profile_photo.jpg",
    tags: ["Verified", "Pro at Delivery"],
    education: "Bachelor of Science in Computer Science",
    location: "San Francisco, CA",
    about:
        "Experienced software engineer with a passion for clean, efficient code.",
    skills: ["Flutter", "Dart", "JavaScript", "React Native"],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    // image: DecorationImage(
                    //   image: AssetImage(developer.profilePhoto),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),

                // Flexible(
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: developer.tags.length,
                //     itemBuilder: (context, index) {
                //       return Column(
                //         children: [
                //           DeveloperTags(tag: developer.tags[index]),
                //         ],
                //       );
                //     },
                //   ),
                // )
                5.kW,

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: developer.tags.map((tag) {
                      return DeveloperTags(tag: tag);
                    }).toList())
              ],
            ),
            const SizedBox(height: 20),
            Text(developer.name,
                style: AppTextStyle.poppinsBoldText(fontSize: 20)),
            10.kH,
            AppElevatedButton(onTap: () {}, text: "Chat"),
            10.kH,
            Text(
              "Education",
              style: AppTextStyle.poppinsBoldText(fontSize: 16),
            ),
            5.kH,
            Text(
              developer.education,
              style: AppTextStyle.poppinsRegularText(fontSize: 16),
            ),
            10.kH,
            10.kH,
            Text(
              "Location",
              style: AppTextStyle.poppinsBoldText(fontSize: 16),
            ),
            5.kH,
            Text(
              developer.location,
              style: AppTextStyle.poppinsRegularText(fontSize: 16),
            ),
            16.kH,
            Text(
              "About:",
              style: AppTextStyle.poppinsBoldText(fontSize: 16),
            ),
            5.kH,
            Text(
              developer.about,
              style: AppTextStyle.poppinsRegularText(fontSize: 16),
            ),
            16.kH,
            const Text(
              "Skills:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            10.kH,
            Wrap(
              spacing: 8.0,
              children: developer.skills.map((skill) {
                return Chip(
                  label: Text(skill),
                );
              }).toList(),
            ),
            20.kH,
          ],
        ),
      ),
    );
  }
}

class DeveloperProfileModel {
  final String name;
  final String profilePhoto;
  final List<String> tags;
  final String education;
  final String location;
  final String about;
  final List<String> skills;

  DeveloperProfileModel({
    required this.name,
    required this.profilePhoto,
    required this.tags,
    required this.education,
    required this.location,
    required this.about,
    required this.skills,
  });
}
