import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interestpe/model/PayHistoryModel.dart';
import 'package:interestpe/utility/routes.dart';

import '../widgets/payHistory/PayHistory_card.dart';


class PayHistory extends StatefulWidget {
  const PayHistory({Key? key}) : super(key: key);

  @override
  _PayHistoryState createState() => _PayHistoryState();
}

class _PayHistoryState extends State<PayHistory> {
  List<PayHistoryModel> list = [
    PayHistoryModel(
      'Ashishraj@ybl',
      'UPI',
      '23 Jan 2025, 6:17pm',
      '₹1000' ,
    ),

    PayHistoryModel(
      'Ashishraj@ybl',
      'UPI',
      '23 Jan 2025, 6:17pm',
      '₹1000' ,
    ),

    PayHistoryModel(
      'Ashishraj@ybl',
      'UPI',
      '23 Jan 2025, 6:17pm',
      '₹1000' ,
    ),

    PayHistoryModel(
      'Ashishraj@ybl',
      'UPI',
      '23 Jan 2025, 6:17pm',
      '₹1000' ,
    ),

    PayHistoryModel(
      'Ashishraj@ybl',
      'UPI',
      '23 Jan 2025, 6:17pm',
      '+₹1000' ,
    ),

    PayHistoryModel(
      'Ashishraj@ybl',
      'UPI',
      '23 Jan 2025, 6:17pm',
      '+₹1000' ,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [IconButton(
              onPressed: () {
                // Logic
                },
              icon: Icon(Icons.chevron_left,size: 30),
            ),
            ]
        ),
        title: Text("Payment History"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => PayhistoryCard(
          key: Key('chat_user_card_$index'), // Add a unique key here
          PayHistoryD: list[index],
        ),
      ),
    );
  }
}