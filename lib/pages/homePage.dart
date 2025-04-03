import 'package:flutter/material.dart';
import '../widgets/chat_card.dart';
import '../model/ChatModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChatModel> chats = [
    ChatModel(
      "Vishal gupta",
      "12:00 PM",
      "Hello",
    ),
    ChatModel(
      "Manish Chaurasiya",
      "12:00 PM",
      "Hello Manish",
    ),
    ChatModel(
      "Ashish Raj",
      "12:00 PM",
      "Hello Ashish",
    ),
    ChatModel(
      "Nitish",
      "12:00 PM",
      "How are you Nitish ?",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 30), // Align text to the right
          child: const Text(
            'interestPe',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 4, // AppBar shadow
        automaticallyImplyLeading: false, // Remove the back button
        titleSpacing: 0, // Remove default title spacing
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => ChatUserCard(
          key: Key('chat_user_card_$index'), // Add a unique key here
          chatmodel: chats[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle "ADD CUSTOMER" button press
          _showAddCustomerDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // Function to show a dialog for adding a new customer
  void _showAddCustomerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String newCustomerName = '';
        return AlertDialog(
          title: const Text('Add Customer'),
          content: TextField(
            decoration: const InputDecoration(hintText: 'Enter customer name'),
            onChanged: (value) {
              newCustomerName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the new customer to the list (you can use a state management solution for this)
                // For now, just print the name
                print('New Customer: $newCustomerName');
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}