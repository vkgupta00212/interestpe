import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async'; // For Timer

import '/bottom_navbar.dart'; // Import your main screen
import 'Login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, // Set background color
        body: Center(
          child: Container(
            width: 350, // Fixed width for the container
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Add padding
            decoration: BoxDecoration(
              color: Colors.blue.shade100, // Background color of the rectangle
              borderRadius: BorderRadius.circular(30), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  offset: const Offset(2, 2), // Shadow offset
                  blurRadius: 4, // Shadow blur radius
                ),
              ],
            ),
            child: Center( // Center the text horizontally and vertically
              child: Text(
                "interestPe", // Your text
                style: TextStyle(
                  fontSize: 36, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight
                  color: Colors.indigo, // Set text color
                  letterSpacing: 2.0, // Add spacing between letters
                ),
             // Center the text horizontally
              ),
            ),
          ),
        ),
    );
  }
}