import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interestpe/utility/routes.dart';
class Otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/bg2.jpg"), // Background image
          fit: BoxFit.cover, // Ensure the image covers the entire screen
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Make Scaffold background transparent
        appBar: AppBar(
          title: Text('Enter 6 Digit OTP',style: TextStyle(
            color: Colors.deepPurple
          ),),
          backgroundColor: Colors.transparent, // Transparent app bar
          elevation: 1, // Remove shadow
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 6,
                style: TextStyle(color: Colors.deepPurple), // White text color
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                  labelStyle: TextStyle(color: Colors.deepPurple), // White label
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple), // White border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple), // White border
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.navBar);
                },
                child: Text('Submit OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}