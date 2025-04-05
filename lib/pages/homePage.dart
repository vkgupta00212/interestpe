import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../model/data.dart';
import '../widgets/header/header.dart';
import 'HomePage/customer_tab.dart';
import '../widgets/chat/search_box.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: kButtonBackground,
          elevation: 3.0,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: kPrimaryColor,
              width: 0.5,
            ),
          ),
          icon:Icon(
            CupertinoIcons.person_add,
            color: kPrimaryColor,
            size: 25,
          ),
          label: const Text(
            'Add Customer',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(height: 15.0),
                const Header(),
                const SizedBox(height: 20.0),
                const SearchBox(),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 250,
                    ),
                  ],
                ),
                const Expanded(
                  child: CustomerTab(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
