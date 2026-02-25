import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final Map<int, int> userAnswers;

  const ReviewScreen({
    super.key,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Answer Review"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          final correctIndex = question["correctIndex"];
          final selectedIndex = userAnswers[index];

          Color statusColor;
          String statusText;

          if (selectedIndex == null) {
            statusColor = Colors.grey;
            statusText = "Unattempted";
          } else if (selectedIndex == correctIndex) {
            statusColor = Colors.green;
            statusText = "Correct";
          } else {
            statusColor = Colors.red;
            statusText = "Wrong";
          }

          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Q${index + 1}. ${question["question"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    "Your Answer: ${selectedIndex != null ? question["options"][selectedIndex] : "Not Attempted"}",
                  ),

                  Text(
                    "Correct Answer: ${question["options"][correctIndex]}",
                    style: const TextStyle(color: Colors.green),
                  ),

                  const SizedBox(height: 5),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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