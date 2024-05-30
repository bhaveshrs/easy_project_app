import 'package:essay_projects/src/config/common_widgets/app_textfild.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';

class AddEducationProfile extends StatefulWidget {
  const AddEducationProfile({super.key});

  @override
  State<AddEducationProfile> createState() => _AddEducationProfileState();
}

class _AddEducationProfileState extends State<AddEducationProfile> {
  TextEditingController yearController = TextEditingController();
  int _selectedStatus =
      0; // 0 represents 'Currently Studying', 1 represents 'Not Studying'

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Education",
            style: AppTextStyle.poppinsBoldText(fontSize: 20),
          ),
          const SizedBox(height: 16),
          Text(
            'Add this filds to describe your education background',
            style: AppTextStyle.poppinsMediumText(fontSize: 17),
          ),
          const SizedBox(height: 16),
          Text(
            'Are you currently studying?',
            style: AppTextStyle.poppinsMediumText(fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio<int>(
                value: 0,
                groupValue: _selectedStatus,
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                },
              ),
              const Text('Yes'),
              Radio<int>(
                value: 1,
                groupValue: _selectedStatus,
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                },
              ),
              const Text('No'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Studied in",
            style: AppTextStyle.poppinsMediumText(fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),
          AppTextField(
            onChange: () {},
            hintText: "eg. collage/university name",
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Year of graduation",
            style: AppTextStyle.poppinsMediumText(fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),
          AppTextField(
            hintText: DateTime.now().year.toString(),
            controller: yearController,
            onChange: () {},
            readOnly: true,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  final Size size = MediaQuery.of(context).size;
                  return AlertDialog(
                    title: Column(
                      children: [
                        Row(
                          children: [
                            const Text('Select a Year'),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        )
                      ],
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    content: SizedBox(
                      height: size.height / 3,
                      width: size.width,
                      child: GridView.count(
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        physics: const BouncingScrollPhysics(),
                        childAspectRatio: 1.3,
                        crossAxisCount: 3,
                        children: [
                          ...List.generate(
                            123,
                            (index) => InkWell(
                              onTap: () {
                                yearController.text =
                                    ((DateTime.now().year + 5) - index)
                                        .toString();
                                setState(() {});
                                print(
                                    "Selected Year ==> ${((DateTime.now().year + 5) - index).toString()}");
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 0),
                                child: Chip(
                                  label: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      ((DateTime.now().year + 5) - index)
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
