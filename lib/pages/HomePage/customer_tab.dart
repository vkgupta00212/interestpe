import 'package:flutter/material.dart';
import 'package:interestpe/utility/routes.dart';
import '../../widgets/chat/transaction_tile.dart';

// Model class for transaction data
class TransactionData {
  final int color;
  final String name;
  final String amount;
  final String remarks;
  final String type;
  final String date;

  TransactionData({
    required this.color,
    required this.name,
    required this.amount,
    required this.remarks,
    required this.type,
    required this.date,
  });
}

class CustomerTab extends StatelessWidget {
  const CustomerTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TransactionData> transactions = [
      TransactionData(
        color: 0xff5099f5,
        name: 'Ashish Raj',
        amount: '250',
        remarks: 'DUE',
        type: 'Payment',
        date: '1 July, 2023',
      ),
      TransactionData(
        color: 0xff9675ce,
        name: 'Manish Chaurasiya',
        amount: '1,300',
        remarks: 'DUE',
        type: 'Payment',
        date: '17 Jun, 2023',
      ),
      TransactionData(
        color: 0xff4dbd91,
        name: 'Vishal Gupta',
        amount: '2,850',
        remarks: 'ADVANCE',
        type: 'Payment',
        date: '2 Jun, 2023',
      ),
      TransactionData(
        color: 0xff4cb6ac,
        name: 'Nitesh Kumar',
        amount: '800',
        remarks: 'ADVANCE',
        type: 'Payment',
        date: '28 Mar, 2023',
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(transactions.length, (index) {
            final transaction = transactions[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.individualChat);
              },
              child: TransactionTile(
                color: transaction.color,
                name: transaction.name,
                amount: transaction.amount,
                remarks: transaction.remarks,
                type: transaction.type,
                date: transaction.date,
              ),
            );
          }),
        ),
      ),
    );
  }
}
