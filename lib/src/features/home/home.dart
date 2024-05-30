// import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/features/user_profile/user_profile.dart';
import 'package:essay_projects/src/features/marketplace/marketplace.dart';
import 'package:essay_projects/src/features/my_projects/my_projects.dart';
import 'package:flutter/material.dart';

// import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    this.title,
  });
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
     TabItem(
      Icons.task,
      "Projects",
      MyTheme.primary,
    ),
    TabItem(
      Icons.shopping_bag,
      "Marketplace",
      MyTheme.primary,
    ),
   
    TabItem(
      Icons.account_circle,
      "Profile",
      MyTheme.primary,
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const MyProjects(),

      const MarketPlace(),
      // const Profile(),
      const UserProfile()
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            screens[selectedPos],
            Positioned(bottom: 0, child: bottomNav()),
          ],
        ),
      ),
      // bottomNavigationBar: bottomNav(),
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      barBackgroundColor: Colors.white,
      // barBackgroundGradient: LinearGradient(
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.topCenter,
      //   colors: [
      //     Colors.blue,
      //     Colors.red,
      //   ],
      // ),
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
