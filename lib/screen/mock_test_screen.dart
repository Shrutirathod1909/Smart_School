import 'package:flutter/material.dart';
import 'exam_settings_screen.dart';

class MockTestScreen extends StatefulWidget {
  final int classNumber;
  const MockTestScreen({super.key, required this.classNumber});

  @override
  State<MockTestScreen> createState() => _MockTestScreenState();
}

class _MockTestScreenState extends State<MockTestScreen> {
  List<Map<String, dynamic>> mockTests = [
    {'title': 'Mock Test - 1', 'attempts': 27310, 'status': 'Not Attempted'},
    {'title': 'Mock Test - 2', 'attempts': 9560, 'status': 'Not Attempted'},
    {'title': 'Mock Test - 3', 'attempts': 6790, 'status': 'Not Attempted'},
    {'title': 'Mock Test - 4', 'attempts': 5320, 'status': 'Not Attempted'},
    {'title': 'Mock Test - 5', 'attempts': 3300, 'status': 'Not Attempted'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SSC MTS 2025"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockTests.length,
        itemBuilder: (context, index) {
          final test = mockTests[index];
          bool isResult = test['status'] == 'Result';
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isResult ? Colors.green[100] : Colors.red[50],
                child: Icon(
                  isResult ? Icons.check : Icons.play_arrow,
                  color: isResult ? Colors.green : Colors.red,
                ),
              ),
              title: Text(
                test['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                test['status'],
                style: TextStyle(
                  color: isResult ? Colors.green : Colors.redAccent,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Attempts - ${test['attempts']}'),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.play_circle_outline),
                    onPressed: () async {
                      final completed = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ExamSettingsScreen(classNumber: widget.classNumber),
                        ),
                      );

                      if (completed == true) {
                        setState(() {
                          mockTests[index]['status'] = 'Result';
                          mockTests[index]['attempts'] =
                              (mockTests[index]['attempts'] as int) + 1;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}