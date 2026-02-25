  import 'package:flutter/material.dart';
  import 'question_screen.dart';

  class ExamSettingsScreen extends StatefulWidget {
    final int classNumber;
    const ExamSettingsScreen({super.key, required this.classNumber});

    @override
    State<ExamSettingsScreen> createState() => _ExamSettingsScreenState();
  }

  class _ExamSettingsScreenState extends State<ExamSettingsScreen> {
    int questionCount = 40;
    bool enableTimer = true;
    bool enableFilter = true;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color(0xffF4F6F9),
        appBar: AppBar(
          backgroundColor: const Color(0xff1E88E5),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Class ${widget.classNumber} - Exam Setup",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔷 HEADER CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff1E88E5), Color(0xff0D47A1)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.quiz, size: 50, color: Colors.white),
                    SizedBox(height: 12),
                    Text(
                      "Configure Your Exam",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Select settings before starting",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Exam Options",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),

              const SizedBox(height: 15),

              /// 🔷 QUESTION COUNT DROPDOWN
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: DropdownButtonFormField<int>(
                    value: questionCount,
                    decoration: InputDecoration(
                      labelText: "Number of Questions",
                      prefixIcon: const Icon(Icons.format_list_numbered),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    items: [5, 10, 15, 20, 40]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text("$e Questions"),
                            ))
                        .toList(),
                    onChanged: (val) =>
                        setState(() => questionCount = val!),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// 🔷 TIMER SWITCH
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: SwitchListTile(
                  activeColor: const Color(0xff1E88E5),
                  secondary: const Icon(Icons.timer, color: Colors.orange),
                  title: const Text("Enable Timer"),
                  subtitle: const Text("Exam will have countdown timer"),
                  value: enableTimer,
                  onChanged: (val) =>
                      setState(() => enableTimer = val),
                ),
              ),

              const SizedBox(height: 15),

              /// 🔷 FILTER SWITCH
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: SwitchListTile(
                  activeColor: const Color(0xff1E88E5),
                  secondary:
                      const Icon(Icons.filter_alt, color: Colors.green),
                  title: const Text("Enable Result Filter"),
                  subtitle:
                      const Text("Tutor"),
                  value: enableFilter,
                  onChanged: (val) =>
                      setState(() => enableFilter = val),
                ),
              ),

              const SizedBox(height: 40),

              /// 🔷 START BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    padding:
                        const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color(0xff1E88E5),
                  ),
                  onPressed: () async {

  final completed = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => QuestionScreen(
        totalQuestions: questionCount,
        enableTimer: enableTimer,
        enableFilter: enableFilter,
      ),
    ),
  );

  Navigator.pop(context, completed); // ✅ return value to MockScreen
},
                  child: const Text(
                    "START EXAM",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }