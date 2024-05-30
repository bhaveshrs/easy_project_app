import 'package:essay_projects/src/config/common_widgets/app_dropdown.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageFifthAddProject extends StatefulWidget {
  const PageFifthAddProject({super.key});

  @override
  State<PageFifthAddProject> createState() => _PageFourthAddProjectState();
}

class _PageFourthAddProjectState extends State<PageFifthAddProject> {
  DateTime? _selectedDate;
  String priorityLevel = 'Normal';
  Color? borderColor;

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Time Details",
              style: AppTextStyle.poppinsSemiBoldText(fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Set Deadline",
              style: AppTextStyle.poppinsMediumText(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor ?? Colors.transparent)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _showDatePicker,
                    child: Expanded(
                      child: Text(
                          _selectedDate == null
                              ? 'DD/MM/YYYY'
                              : 'Deadline: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}',
                          style: AppTextStyle.poppinsMediumText(fontSize: 16)
                          // const TextStyle(fontSize: 16.0),
                          ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: _showDatePicker,
                    child: Text(
                      'Select Date',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Set Priority Level",
              style: AppTextStyle.poppinsMediumText(fontSize: 18),
            ),
            const SizedBox(height: 10.0),
            AppDropdown(
                borderColor: Colors.grey,
                value: priorityLevel,
                onChanged: (String? value) {
                  setState(() {
                    if (value == 'Low') {
                      borderColor =
                          Colors.green; // Example color for Low priority
                    } else if (value == 'Normal') {
                      borderColor =
                          Colors.yellow; // Example color for Normal priority
                    } else if (value == 'High') {
                      borderColor =
                          Colors.orange; // Example color for High priority
                    } else if (value == 'Urgent') {
                      borderColor =
                          Colors.red; // Example color for Urgent priority
                    }
                    priorityLevel = value!;
                  });
                },
                items: const ['Low', 'Normal', 'High', 'Urgent']),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.donut_small_rounded),
                  ),
                  Flexible(
                    child: Text(
                      "Higher priority can cause high charges its wary on all project requirements",
                      style: AppTextStyle.poppinsRegularText(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
 
  


    // const Text(
    //           'Set Deadline',
    //           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    //         ),
    //         const SizedBox(height: 10.0),
    //         Row(
    //           children: [
    //             Expanded(
    //               child: Text(
    //                 _selectedDate == null
    //                     ? 'Select a date'
    //                     : 'Deadline: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}',
    //                 style: const TextStyle(fontSize: 16.0),
    //               ),
    //             ),
    //             TextButton(
    //               onPressed: _showDatePicker,
    //               child: Text(
    //                 'Select Date',
    //                 style: TextStyle(color: Theme.of(context).primaryColor),
    //               ),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(height: 20.0),
    //         const Text(
    //           'Set Priority Level',
    //           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    //         ),
    //         const SizedBox(height: 10.0),
    //         DropdownButton<String>(
    //           value: _priorityLevel,
    //           onChanged: (String? value) {
    //             setState(() {
    //               _priorityLevel = value!;
    //             });
    //           },
    //           items: ['Low', 'Normal', 'High', 'Urgent'].map((value) {
    //             return DropdownMenuItem<String>(
    //               value: value,
    //               child: Text(value),
    //             );
    //           }).toList(),
    //         ),