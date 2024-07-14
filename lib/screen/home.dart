import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final TextEditingController _nameController = TextEditingController();
  List<Map<String, dynamic>> _predictions = [];

  Future<void> _predictNationality() async {
    final response = await http.get(Uri.parse('https://api.nationalize.io/?name=${_nameController.text}'));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _predictions = List<Map<String, dynamic>>.from(data['country']);
      });
    } else {
      throw Exception('Failed to predict nationality');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Predict Nationality')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Enter a name'),
            ),
            ElevatedButton(
              onPressed: _predictNationality,
              child: const Text('Predict'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _predictions.length,
                itemBuilder: (context, index) {
                  final prediction = _predictions[index];
                  return ListTile(
                    title: Text('${prediction['country_id']}'),
                    subtitle: Text('Probability: ${(prediction['probability'] * 100).toStringAsFixed(2)}%'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}