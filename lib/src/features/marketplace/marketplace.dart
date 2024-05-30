import 'package:animations/animations.dart';
import 'package:essay_projects/src/config/common_widgets/app_bar.dart';
import 'package:essay_projects/src/config/common_widgets/app_textfild.dart';
import 'package:essay_projects/src/features/marketplace/widgets/market_place_conatiner.dart';
import 'package:essay_projects/src/features/marketplace/widgets/market_place_grid_tile.dart';
import 'package:flutter/material.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({super.key});

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace>
    with SingleTickerProviderStateMixin {
  bool _isSearching = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isGridView = false; // New variable to toggle view mode

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    print(_animation.value);
    return SafeArea(
        child: Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.surfaceTint.withOpacity(0.005),
      appBar: CommonAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _isSearching = !_isSearching;
                    if (_isSearching) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: IconButton(
                icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
                onPressed: () {
                  setState(() {
                    _isGridView = !_isGridView;
                  });
                },
              ),
            ),
          ],
          elevation: 5,
          title: "Market place",
          height: !_isSearching ? kToolbarHeight : kToolbarHeight + 50,
          bottom: PreferredSize(
            preferredSize: !_isSearching
                ? const Size.fromHeight(0)
                : const Size.fromHeight(60),
            child: Visibility(
              visible: _isSearching,
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        // height: 50 * _animation.value,
                        offset: Offset(0, -50 * (1 - _animation.value)),
                        child: Opacity(
                          opacity: _animation.value,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: AppTextField(
                              contentPadding: const EdgeInsets.all(0),
                              prefixIcon: const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Icon(
                                    Icons.search,
                                    size: 20,
                                    color: Colors.grey,
                                  )),
                              onChange: () {},
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   child: AppTextField(contentPadding: EdgeInsets.all(0),
            //     prefixIcon: const SizedBox(
            //         height: 20,
            //         width: 20,
            //         child: Icon(
            //           Icons.search,
            //           size: 20,
            //           color: Colors.grey,
            //         )),
            //     onChange: () {},
            //   ),
            // ),
          )),
      body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Expanded(
              child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeThroughTransition(
                fillColor: Theme.of(context)
                    .colorScheme
                    .surfaceTint
                    .withOpacity(0.005),
                animation: animation,
                secondaryAnimation: ReverseAnimation(animation),
                child: child,
              );
            },
            child: _isGridView
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return MarketPlaceGridTile();
                    },
                  )
                : ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          MarketPlaceContainer(),
                          if (index == 7)
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                            )
                        ],
                      );
                    },
                  ),
          ))),
    ));
  }
}
 // SizedBox(height: MediaQuery.of(context).size.height*0.15,)