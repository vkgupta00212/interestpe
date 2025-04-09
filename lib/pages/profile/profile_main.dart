import 'package:flutter/material.dart';
import 'package:interestpe/model/data.dart';
import 'package:provider/provider.dart';

class ProfileMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<DataModel>(
            builder: (context, dataModel, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: (){},
                    child: const Row(
                      children: [
                        Hero(
                            tag: 'Profile',
                            child:CircleAvatar(
                              radius: 25.0,
                              backgroundImage: AssetImage("assets/img/user.jpeg"),
                            )
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
