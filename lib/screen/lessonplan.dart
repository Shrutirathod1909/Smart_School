import 'package:flutter/material.dart';

class LessonPlanScreen extends StatefulWidget {
  const LessonPlanScreen({super.key});

  @override
  State<LessonPlanScreen> createState() => _LessonPlanScreenState();
}

class _LessonPlanScreenState extends State<LessonPlanScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime startOfWeek = DateTime(2026, 1, 26);

  // Color Orbit Palette
  static const Color bgColor = Color(0xffF5F6FA);
  static const List<Color> appBarGradient = [Color(0xff42a5f5), Color(0xff7e57c2)];
  static const List<Color> cardHeaderGradient = [Color(0xffff7043), Color(0xffffca28)];
  static const List<Color> dateRangeGradient = [Color(0xff42e695), Color(0xff3bb2b8)];
  static const Color cardBgColor = Colors.white;
 

  //////////////////////////////////////////////////////////
  /// DATE PICKER
  //////////////////////////////////////////////////////////

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff42a5f5), // Orbit theme primary
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  //////////////////////////////////////////////////////////
  /// WEEK NAVIGATION
  //////////////////////////////////////////////////////////

  void previousWeek() {
    setState(() {
      startOfWeek = startOfWeek.subtract(const Duration(days: 7));
    });
  }

  void nextWeek() {
    setState(() {
      startOfWeek = startOfWeek.add(const Duration(days: 7));
    });
  }

  String format(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year}";
  }

  String getDateRange() {
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
    return "${format(startOfWeek)} - ${format(endOfWeek)}";
  }

  //////////////////////////////////////////////////////////
  /// BUILD
  //////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: appBarGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text("Lesson Plan", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _pickDate,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() {}),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff42a5f5), Color(0xff7e57c2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Your Lessons are here!",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Access your lessons and study material",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.book, size: 40, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // DATE RANGE NAVIGATION
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: dateRangeGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: previousWeek,
                  ),
                  Text(
                    getDateRange(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: nextWeek,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // DAY SECTIONS
            buildDaySection(0, "Monday"),
            const SizedBox(height: 20),
            buildDaySection(1, "Tuesday"),
            const SizedBox(height: 20),
            buildDaySection(2, "Wednesday"),
            const SizedBox(height: 20),
            buildDaySection(3, "Thursday"),
            const SizedBox(height: 20),
            buildDaySection(4, "Friday"),
            const SizedBox(height: 20),
            buildDaySection(5, "Saturday"),
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////
  /// DYNAMIC DAY SECTION
  //////////////////////////////////////////////////////////

  Widget buildDaySection(int index, String dayName) {
    DateTime date = startOfWeek.add(Duration(days: index));

    List<Map<String, String>> lessons = [
      {"subject": "English (210)", "time": "9:00 AM - 09:45 AM", "syllabus": "Grammar Chapter 1"},
      {"subject": "Mathematics (110)", "time": "09:45 AM - 10:30 AM", "syllabus": "Practice Session"},
      {"subject": "Hindi (230)", "time": "10:30 AM - 11:15 AM", "syllabus": "Reading & Writing"},
      {"subject": "Computer (00220)", "time": "11:15 AM - 12:00 PM", "syllabus": "Practical Lab"},
    ];

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day Header
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: cardHeaderGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dayName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                Text(format(date),
                    style: const TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Table Header
          const Row(
            children: [
              Expanded(
                  child: Text("Subject",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text("Time",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text("Syllabus",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
          const Divider(),

          // Lesson Rows
          ...lessons.map((lesson) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Expanded(child: Text(lesson["subject"]!)),
                  Expanded(child: Text(lesson["time"]!)),
                  Expanded(child: Text(lesson["syllabus"]!)),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}