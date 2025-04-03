import 'package:flutter/material.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<searchPage> {
  // Dummy list of items to search from
  final List<String> searchItems = [
    'Vishal',
    'Manish',
    'Ashish Raj',
    'Anurag',
  ];

  // List to store search results
  List<String> searchResults = [];

  // Controller for the search bar
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize search results with all items
    searchResults = searchItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (query) {
                // Update search results based on the query
                setState(() {
                  searchResults = searchItems
                      .where((item) =>
                      item.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          // Display search results
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index]),
                  onTap: () {
                    // Handle item tap
                    print('${searchResults[index]} clicked');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}