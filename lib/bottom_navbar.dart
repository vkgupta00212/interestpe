import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interestpe/model/data.dart';
import 'package:interestpe/widgets/more/moreCard.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _backgroundOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuad,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuad,
    ));

    _backgroundOpacityAnimation = Tween<double>(
      begin: 1,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuad,
    ));
  }

  void _toggleBottomSheet() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildMainContent(DataModel value) {
    return value.navigationOptions[value.currentIndex];
  }

  Widget _buildOverlay() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Visibility(
          visible: _controller.value > 0,
          child: GestureDetector(
            onTap: _toggleBottomSheet,
            behavior: HitTestBehavior.opaque,
            child: Container(
              color: Colors.black.withOpacity(0.7 * _controller.value),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: mediaQuery.size.height * 0.3,
              ),
              margin: const EdgeInsets.only(
                bottom: 5,
                left: 0,
                right: 0,
              ),
              decoration: BoxDecoration(
                color: kNavBackground,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: BusinessBottomSheet(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigationBar(DataModel value) {
    return Material(
      elevation: 0,
      color: kNanvbarBackground,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Divider at the top of the navigation bar

          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
            child: NavigationBar(
              backgroundColor: kNanvbarBackground,
              elevation: 3,
              indicatorColor: Colors.grey.withOpacity(0.3),
              selectedIndex: value.currentIndex,
              onDestinationSelected: (int index) {
                if (index == 1) {
                  _toggleBottomSheet();
                } else {
                  if (_controller.status == AnimationStatus.forward ||
                      _controller.status == AnimationStatus.completed) {
                    _controller.reverse().then((_) {
                      value.updateCurrentIndex(index);
                    });
                  } else {
                    value.updateCurrentIndex(index);
                  }
                }
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(CupertinoIcons.house_alt),
                  selectedIcon: Icon(CupertinoIcons.house_alt_fill,color: kPrimaryColor,),
                  label:"Home",
                ),
                NavigationDestination(
                  icon: Icon(CupertinoIcons.arrow_up_circle),
                  selectedIcon: Icon(CupertinoIcons.arrow_up_circle_fill),
                  label: 'More',

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
      builder: (context, value, child) {
        return Scaffold(
          body: Stack(
            children: [
              _buildMainContent(value),
              _buildOverlay(),
              _buildBottomSheet(context),
            ],
          ),
          // Changed bottomNavigationBar to match navbar background color
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: kNanvbarBackground,
            ),
                child: _buildNavigationBar(value)
          )
        );
      },
    );
  }
}
