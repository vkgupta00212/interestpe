import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interestpe/model/ChatModel.dart';
import 'package:interestpe/utility/routes.dart';


class ChatUserCard extends StatelessWidget {
  const ChatUserCard({Key? key, required this.chatmodel}) : super(key: key); // Make key optional
  final ChatModel chatmodel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MyRoutes.individualChat);
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person, size: 30),
              radius: 25,
            ),
            title: Text(
              chatmodel.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                  chatmodel.currentMessage,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: Text(chatmodel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 75, right: 15),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}