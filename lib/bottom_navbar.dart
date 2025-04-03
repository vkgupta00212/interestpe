import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interestpe/model/data.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
      builder: (context, value, child) {
        return Scaffold(
          body: value.navigationOptions[value.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(  // Top divider instead of bottom
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
            ),
            child: SizedBox(
              height: 80, // Optimal height for NavigationBar + padding
              child: NavigationBar(
                onDestinationSelected: (int index) {
                  value.updateCurrentIndex(index);
                },
                selectedIndex: value.currentIndex,
                destinations: const <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(CupertinoIcons.house_alt_fill),
                    icon: Icon(CupertinoIcons.house_alt),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(CupertinoIcons.arrow_up_circle),
                    selectedIcon: Icon(CupertinoIcons.arrow_up_circle_fill),
                    label: 'More',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}