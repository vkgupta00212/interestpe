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

           GestureDetector(
              // onTap: () => showModalBottomSheet(
              //   context: context,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   builder: (context) {
              //     return const BusinessBottomSheet();
              //   },
              // ),
              child: const CircleAvatar(
                radius: 16.5,
                backgroundImage: AssetImage('assets/img/user.jpeg'),
              ),
            )
      ],
    );
  }
}
