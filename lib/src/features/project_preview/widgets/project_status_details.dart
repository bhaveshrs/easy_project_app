import 'package:essay_projects/src/config/common_widgets/app_bar.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';

class ProjectStatus {
  final String title;
  final String status;
  final DateTime timestamp;
  final bool isComplete;

  ProjectStatus({
    required this.title,
    required this.status,
    required this.timestamp,
    this.isComplete = false,
  });
}

class ProjectWorkStatus extends StatefulWidget {
  const ProjectWorkStatus({super.key});

  @override
  State<ProjectWorkStatus> createState() => _ProjectWorkStatusState();
}

class _ProjectWorkStatusState extends State<ProjectWorkStatus> {
  List<ProjectStatus> statuses = [
    ProjectStatus(
      isComplete: true,
      title: "Project Bidding",
      status: "Bidding Closed",
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
    ),
    ProjectStatus(
      isComplete: true,
      title: "Developer Assigned",
      status: "Developer Assigned to Project",
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
    ),
    ProjectStatus(
      title: "First Payment",
      status: "First Payment Received",
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
    ),
    ProjectStatus(
      title: "Project Started",
      status: "Project Started by Developer",
      timestamp: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: "Project Progress",
      ),
      body: ListView.builder(
        itemCount: statuses.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  child: Row(
                    children: [
                      Icon(
                        statuses[index].isComplete
                            ? Icons.check_circle
                            : Icons.access_time,
                        color: statuses[index].isComplete
                            ? Colors.green
                            : Colors.orange,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            statuses[index].title,
                            style: AppTextStyle.poppinsBoldText(
                              fontSize: 16,
                            ),
                          ),
                          Text(statuses[index].status),
                        ],
                      ),
                      const Spacer(),
                      if (statuses[index].isComplete)
                        Text(
                          '${statuses[index].timestamp.day}/${statuses[index].timestamp.month}/${statuses[index].timestamp.year}',
                        ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
