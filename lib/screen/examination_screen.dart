import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExaminationScreen(),
    );
  }
}

class ExaminationScreen extends StatelessWidget {
  const ExaminationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef1f5),
      appBar: AppBar(
        backgroundColor: const Color(0xff505B63),
        centerTitle: true,
        title: const Text(
          "Examination",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExamCard(
            examName: "Unit Test 1",
            date: "10 March 2026",
            marks: "100",
            status: "Upcoming",
          ),
          SizedBox(height: 20),
          ExamCard(
            examName: "Mid Term Exam",
            date: "15 January 2026",
            marks: "100",
            status: "Completed",
          ),
          SizedBox(height: 20),
          ExamCard(
            examName: "Final Exam",
            date: "20 June 2026",
            marks: "100",
            status: "Upcoming",
          ),
        ],
      ),
    );
  }
}

class ExamCard extends StatelessWidget {
  final String examName;
  final String date;
  final String marks;
  final String status;

  const ExamCard({
    super.key,
    required this.examName,
    required this.date,
    required this.marks,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    bool isCompleted = status == "Completed";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            examName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(height: 25),

          /// Date
          Row(
            children: [
              const Icon(Icons.calendar_today,
                  size: 18, color: Colors.grey),
              const SizedBox(width: 8),
              Text("Date: $date"),
            ],
          ),

          const SizedBox(height: 10),

          /// Total Marks
          Row(
            children: [
              const Icon(Icons.menu, size: 18, color: Colors.grey),
              const SizedBox(width: 8),
              Text("Total Marks: $marks"),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color:
                      isCompleted ? Colors.green : Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: isCompleted
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ExamDetailsPage(
                                    examName: examName),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xff505B63),
                ),
                child: const Text(
                  "View Result",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExamDetailsPage extends StatelessWidget {
  final String examName;

  const ExamDetailsPage(
      {super.key, required this.examName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subjects = [
      {"name": "English", "obtained": 85, "total": 100},
      {"name": "Mathematics", "obtained": 90, "total": 100},
      {"name": "Science", "obtained": 88, "total": 100},
      {"name": "History", "obtained": 80, "total": 100},
      {"name": "Computer", "obtained": 95, "total": 100},
    ];

    int totalObtained =
        subjects.fold(0, (sum, item) => sum + item["obtained"] as int);
    int totalMarks =
        subjects.fold(0, (sum, item) => sum + item["total"] as int);
    double percentage =
        (totalObtained / totalMarks) * 100;

    return Scaffold(
      backgroundColor: const Color(0xffd9dde3),
      appBar: AppBar(
        backgroundColor: const Color(0xff505B63),
        centerTitle: true,
        iconTheme:
            const IconThemeData(color: Colors.white),
        title: const Text(
          "Exam Result",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),

              Text(
                examName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              /// Subject Card
              Container(
                width:
                    MediaQuery.of(context).size.width *
                        0.9,
                padding:
                    const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:
                      const Color(0xffeeeeee),
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: const [
                        Text("Subject",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight
                                        .bold)),
                        Text("Marks",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight
                                        .bold)),
                      ],
                    ),
                    const Divider(),

                    ...subjects.map(
                      (subject) => Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            children: [
                              Text(subject["name"]),
                              Text(
                                  "${subject["obtained"]}/${subject["total"]}"),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// Total Card
              Container(
                width:
                    MediaQuery.of(context).size.width *
                        0.75,
                padding:
                    const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:
                      const Color(0xffeeeeee),
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      "Total: $totalObtained / $totalMarks",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Percentage: ${percentage.toStringAsFixed(1)}%",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}