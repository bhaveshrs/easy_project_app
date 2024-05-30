import 'package:flutter/material.dart';

typedef MyCircularBottomNavSelectedCallback = Function(int? selectedPos);

class MyCircularBottomNavigation extends StatefulWidget {
  final List<MyTabItem> tabItems;
  final int selectedPos;
  final MyCircularBottomNavSelectedCallback? selectedCallback;

  MyCircularBottomNavigation({
    required this.tabItems,
    this.selectedPos = 0,
    this.selectedCallback,
  });

  @override
  State<StatefulWidget> createState() => _CircularBottomNavigationState();
}

class _CircularBottomNavigationState extends State<MyCircularBottomNavigation> {
  int? selectedPos;

  @override
  void initState() {
    super.initState();
    selectedPos = widget.selectedPos;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.tabItems.map((item) {
        int index = widget.tabItems.indexOf(item);
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedPos = index;
              if (widget.selectedCallback != null) {
                widget.selectedCallback!(selectedPos);
              }
            });
          },
          child: Column(
            children: [
              Icon(
                item.icon,
                color: selectedPos == index
                    ? item.selectedIconColor
                    : item.normalIconColor,
              ),
              Text(
                item.title,
                style: TextStyle(
                  color: selectedPos == index
                      ? item.selectedIconColor
                      : item.normalIconColor,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class MyCircularBottomNavigationController extends ValueNotifier<int?> {
  MyCircularBottomNavigationController(int? value) : super(value);
}

class MyTabItem {
  final IconData icon;
  final String title;
  final Color selectedIconColor;
  final Color normalIconColor;

  MyTabItem({
    required this.icon,
    required this.title,
    required this.selectedIconColor,
    required this.normalIconColor,
  });
}
