import 'package:flutter/material.dart';
import 'package:interestpe/widgets/moreCard.dart';
import '../pages/homePage.dart';
import '../pages/morePage.dart';


class DataModel with ChangeNotifier {
  int _currentIndex = 0; // Tracks the current selected index
  final List<Widget> _navigationOptions = [
    const HomePage(),
    const MorePage(),
  ];

  // Getter for currentIndex
  int get currentIndex => _currentIndex;

  // Getter for navigationOptions
  List<Widget> get navigationOptions => _navigationOptions;

  // Method to update the currentIndex
  void updateCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}
