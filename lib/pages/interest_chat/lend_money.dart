import 'package:flutter/material.dart';
import 'package:interestpe/constants.dart';

class  LendMoney extends StatelessWidget{
  const LendMoney({super.key});

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
      body: _buildLendContent(),
    );
  }
}

Widget _buildProfileSection(int color, String name) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Color(color),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                name[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 2),
              const Text(
                "₹0",
                style: TextStyle(
                  color: kPrimaryColor,
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
      ),
    ],
  );
}

Widget _buildLendContent (){
  TextEditingController _amountController = TextEditingController();
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.currency_rupee),
        hintText: "0",
        hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
      ),
    ),
  );
}