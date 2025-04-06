import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../model/data.dart';


class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 1.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: kButtonBackground, // Light blue background
            borderRadius: BorderRadius.circular(40), // Pill shape
            border: Border.all(
              color: Color(0xFF003087), // Dark blue border
              width: 0.5,
            ),
          ),
          child: Text(
            'interestPe',
            style: TextStyle(
              color: Color(0xFF003087),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const Spacer(),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: kButtonBackground, // Light blue background
            borderRadius: BorderRadius.circular(40), // Pill shape
            border: Border.all(
              color: Color(0xFF003087), // Dark blue border
              width: 0.5,
            ),
          ),
          child: Row(
            children: [

              Icon(CupertinoIcons.share,
                size: 18,
              ),

              SizedBox(width: 10),

              Text(
                "Share",style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
