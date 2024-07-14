import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchHistoryScreen extends StatefulWidget {
  const SearchHistoryScreen({super.key});

  @override
  _SearchHistoryScreenState createState() => _SearchHistoryScreenState();
}

class _SearchHistoryScreenState extends State<SearchHistoryScreen> {
  // This would typically be fetched from a database or storage
  final List<Map<String, dynamic>> _searchHistory = [
    {'name': 'John', 'date': '2023-07-14', 'topNationality': 'USA'},
    {'name': 'Maria', 'date': '2023-07-13', 'topNationality': 'Spain'},
    {'name': 'Yuki', 'date': '2023-07-12', 'topNationality': 'Japan'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF66B4F4),
        title: const Text('Search History'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400, Colors.purple.shade500],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Past Searches',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _searchHistory.length,
                    itemBuilder: (context, index) {
                      final search = _searchHistory[index];
                      return _buildSearchCard(
                        name: search['name'],
                        date: search['date'],
                        topNationality: search['topNationality'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchCard({
    required String name,
    required String date,
    required String topNationality,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white.withOpacity(0.2),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          child: FaIcon(FontAwesomeIcons.user, color: Color(0xFF66B4F4)),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          'Searched on $date',
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Chip(
          label: Text(
            topNationality,
            style: const TextStyle(color: Color(0xFF66B4F4)),
          ),
          backgroundColor: Colors.white,
        ),
        onTap: () {
          // You could navigate to a detailed view of this search result
          // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchDetailScreen(name: name)));
        },
      ),
    );
  }
}