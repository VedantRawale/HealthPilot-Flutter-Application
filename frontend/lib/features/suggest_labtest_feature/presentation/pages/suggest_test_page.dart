import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SuggestTestPage extends StatefulWidget {
  const SuggestTestPage({super.key});

  @override
  State<SuggestTestPage> createState() => _SuggestTestPageState();
}

class _SuggestTestPageState extends State<SuggestTestPage> {
  final TextEditingController _symptomController = TextEditingController();
  List<String> recommendedTests = [];
  bool isLoading = false;
  String? error;

  Future<void> _suggestTests() async {
    setState(() {
      isLoading = true;
      error = null;
      recommendedTests.clear();
    });

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/api/suggestTest'), // Update with your server address
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'symptoms': _symptomController.text}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          recommendedTests = List<String>.from(data['tests']);
        });
      } else {
        setState(() {
          error = data['message'] ?? "Something went wrong.";
        });
      }
    } catch (e) {
      setState(() {
        error = "Failed to connect to the server.";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

 @override
Widget build(BuildContext context) {
  final theme = Theme.of(context);

  return Scaffold(
    appBar: AppBar(
      title: const Text("AI Test Suggestion"),
      centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _symptomController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter symptoms (e.g., high fever, fatigue)',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: isLoading ? null : _suggestTests,
            icon: const Icon(Icons.local_hospital),
            label: const Text("Suggest Tests"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 24),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (error != null)
            Text(error!, style: const TextStyle(color: Colors.red))
          else if (recommendedTests.isNotEmpty)
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  recommendedTests.join('\n• '), // Joined with bullet point or just '\n'
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
}
