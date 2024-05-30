import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/common_widgets/app_textfild.dart';
import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:go_router/go_router.dart';

class PageSecAddProject extends StatefulWidget {
  const PageSecAddProject({super.key});

  @override
  State<PageSecAddProject> createState() => _PageSecAddProjectState();
}

class _PageSecAddProjectState extends State<PageSecAddProject> {
  final List<String> _items = [
    'Dart',
    'Python',
    'JavaScript',
    'Java',
    'C#',
    'C++',
    'Go Lang',
    'Swift',
    'PHP',
    'Kotlin',
  ];
  List _selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills needed",
            style: AppTextStyle.poppinsSemiBoldText(fontSize: 24),
          ),
          10.kH,
         
          AppTextField(
            hintText: "Select",
            onChange: () {},
            readOnly: true,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text("Done"))
                    ],
                    title: Text(
                      "Select Skill you Want",
                      style: AppTextStyle.poppinsSemiBoldText(fontSize: 20),
                    ),
                    content: MultiSelectContainer(
                        maxSelectableCount: 5,
                        items: _items.map((item) {
                          // Check if the current item is in the selectedItems list
                          bool isSelected = _selectedItems.contains(item);
                          return MultiSelectCard(
                              value: item, label: item, selected: isSelected);
                        }).toList(),
                        onMaximumSelected: (allSelectedItems, selectedItem) {},
                        onChange: (allSelectedItems, selectedItem) {
                          print(allSelectedItems);
                          _selectedItems = allSelectedItems;
                          setState(() {});
                        }),
                  );
                },
              );
            },
          ),
          10.kH,
         
          if (_selectedItems.isNotEmpty) ...[
            Text(
              "Selected Skill",
              style: AppTextStyle.poppinsSemiBoldText(fontSize: 12),
            ),
            10.kH,
           
            Wrap(
              spacing: 8, // Horizontal spacing between items
              runSpacing: 8, // Vertical spacing between lines
              children: _selectedItems.map((tag) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: MyTheme.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      tag,
                      style: AppTextStyle.poppinsMediumText(
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ]
        ],
      ),
    );
  }
}
