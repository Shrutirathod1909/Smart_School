  import 'package:flutter/material.dart';
  import 'package:market/screen/solution_screen.dart';
  import 'question_screen.dart';

  class TestResultScreen extends StatefulWidget {
    final int totalQuestions;
    final int correct;
    final int wrong;
    final int unattempted;
    final double accuracy;
    final int timeTaken;
    final Map<int, int> userAnswers;

    final List<Map<String, dynamic>> questions;

    const TestResultScreen({
      super.key,
      required this.totalQuestions,
      required this.correct,
      required this.wrong,
      required this.unattempted,
      required this.accuracy,
      required this.timeTaken,
      required this.questions,
      required this.userAnswers,
    });

    @override
    State<TestResultScreen> createState() => _TestResultScreenState();
  }

  class _TestResultScreenState extends State<TestResultScreen> {
    @override
    Widget build(BuildContext context) {
      double percentage = (widget.correct / widget.totalQuestions) * 100;

      double negativeMarks = widget.wrong * 0.25;
      double finalScore = widget.correct - negativeMarks;

      bool isPassed = percentage >= 40;

      return Scaffold(
        backgroundColor: const Color(0xffF4F6FA),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 🔷 HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, bottom: 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isPassed
                        ? [Colors.green, Colors.teal]
                        : [Colors.red, Colors.redAccent],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      isPassed ? "🎉 PASSED" : "❌ FAILED",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "${percentage.toStringAsFixed(1)}%",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 📊 SUMMARY CARD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        buildRow(
                          "Total Questions",
                          widget.totalQuestions.toString(),
                        ),
                        buildRow(
                          "Correct",
                          widget.correct.toString(),
                          Colors.green,
                        ),
                        buildRow("Wrong", widget.wrong.toString(), Colors.red),
                        buildRow(
                          "Unattempted",
                          widget.unattempted.toString(),
                          Colors.orange,
                        ),
                        buildRow(
                          "Negative Marks",
                          negativeMarks.toStringAsFixed(2),
                          Colors.redAccent,
                        ),
                        buildRow(
                          "Final Score",
                          finalScore.toStringAsFixed(2),
                          Colors.blue,
                        ),
                        buildRow(
                          "Accuracy",
                          "${widget.accuracy.toStringAsFixed(2)}%",
                        ),
                        buildRow(
                          "Time Taken",
                          "${widget.timeTaken ~/ 60} min ${widget.timeTaken % 60} sec",
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 📋 TEXT FORMAT DETAILS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Answer Summary (Text Format)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text("✔ Correct Questions: ${widget.correct}"),
                        Text("✖ Wrong Questions: ${widget.wrong}"),
                        Text("➖ Unattempted Questions: ${widget.unattempted}"),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔘 BUTTONS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ReviewScreen(
            questions: widget.questions,
            userAnswers: widget.userAnswers,
          ),
        ),
        );// Solution page navigation
                        },
                        child: const Text("View Detailed Solutions",style: TextStyle(color: Colors.white),),
                      ),
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1E3C72),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionScreen(
                                totalQuestions: 10,
                                enableTimer: true,
                                enableFilter: true,
                              ),
                            ),
                          );
                        },
                        child: const Text("Re-Attempt Test",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    }

    Widget buildRow(String title, String value, [Color? color]) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      );
    }
  }
