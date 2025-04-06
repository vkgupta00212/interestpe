import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../constants.dart';
import '../model/ChatModel.dart';
import '../widgets/profile/profileNavbar.dart';


class IndividualChat extends StatefulWidget{



  const IndividualChat({Key? key,
  }) : super(key: key);

  // final ChatModel chatmodel;
  // final int color;
  // final String name;

  @override
  _IndividualChatState createState()=> _IndividualChatState();

}



class _IndividualChatState extends State<IndividualChat>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        titleSpacing: 0,
        title: _buildProfileSection(
            0xff5099f5,"Vishal Gupta"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.04,
              left: MediaQuery.of(context).size.width * 0.03,
              child: Column(
                children: [

                  _buildPaymentItem("2000", "4:30pm"),
                  SizedBox(height: 10),
                  _buildPaymentItem("2000", "4:30pm"),
                  SizedBox(height: 10),
                  _buildPaymentItem("500", "5:45pm"),
                ],
              ),

            ),

            // Positioned(
            //   top: MediaQuery.of(context).size.height * 0.04,
            //   left: MediaQuery.of(context).size.width * 0.03,
            //   right: MediaQuery.of(context).size.width * 0.03, // Add right constraint
            //   child: SizedBox(
            //     height: MediaQuery.of(context).size.height * 0.6, // Set a height
            //     child: ListView.builder(
            //       itemCount: paymentItems.length, // Your data list length
            //       itemBuilder: (context, index) {
            //         return _buildPaymentItem(
            //           paymentItems[index].amount,
            //           paymentItems[index].time,
            //         );
            //       },
            //     ),
            //   ),
            // )

            // Positioned(
            //   bottom: MediaQuery.of(context).size.height * 0.02,
            //   left: MediaQuery.of(context).size.width * 0.01,
            //   right: MediaQuery.of(context).size.width * 0.01,
            //   child: _buildActionButtons(),
            // ),
          ],
        ),
      ),
      bottomNavigationBar:Container(
        child: profileNavbar(),
      )
    );
  }
}

Widget _buildProfileSection(int color, String name) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Text(
                "View Profile",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.only(
          right: 15,
        ),
        child: IconButton(
          icon: const Icon(CupertinoIcons.phone),
          onPressed: () {
            // Add your call logic here
          },
        ),
      ),
    ],
  );
}


Widget _buildPaymentItem(String amount, String time) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.push_pin, color: Colors.grey),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
        TextButton.icon(
          icon: const Icon(Icons.share, size: 20),
          label: const Text('Share'),
          onPressed: () {},
        ),
      ],
    ),
  );
}






