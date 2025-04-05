import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interestpe/model/PayHistoryModel.dart';

class PayhistoryCard extends StatelessWidget {
  const PayhistoryCard({Key? key, required this.PayHistoryD}) : super(key: key); // Make key optional
  final PayHistoryModel PayHistoryD;

  @override
  Widget build(BuildContext context) {
    return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFEEEBEB),
              radius: 25,
              child: SvgPicture.asset("assets/icons/rupee.svg",
                width: 18,
              ),
            ),
            title: Text(
              PayHistoryD.upiId,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${PayHistoryD.type}. ${PayHistoryD.dati}', // Concatenate type and date
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: Text(
              PayHistoryD.amount,
              style: TextStyle(
                color: PayHistoryD.amount.startsWith('+')
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
    );
  }
}