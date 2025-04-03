import 'package:flutter/material.dart';
import '../widgets/moreCard.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the height of the bottom navigation bar
    final double bottomNavBarHeight = kBottomNavigationBarHeight;
    // Add some extra space (e.g., 8.0) between the sheet and navbar
    final double bottomPadding = bottomNavBarHeight + 8.0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true, // Important for proper positioning
        builder: (context) => Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: const BusinessBottomSheet(),
        ),
      );
    });

    return const Scaffold(body: SizedBox.shrink());
  }
}