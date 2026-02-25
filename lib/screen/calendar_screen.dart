import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SchoolCalendarScreen(),
    );
  }
}

class SchoolCalendarScreen extends StatefulWidget {
  const SchoolCalendarScreen({super.key});

  @override
  State<SchoolCalendarScreen> createState() => _SchoolCalendarScreenState();
}

class _SchoolCalendarScreenState extends State<SchoolCalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // ✅ Full Year School Event Data
  final Map<DateTime, List<Map<String, String>>> schoolEvents = {
    DateTime(2026, 1, 1): [
      {"title": "New Year’s Day", "type": "Holiday"},
    ],
    DateTime(2026, 1, 14): [
      {"title": "Makar Sankranti", "type": "Festival"},
    ],
    DateTime(2026, 1, 26): [
      {"title": "Republic Day", "type": "National"},
    ],
    DateTime(2026, 2, 19): [
      {"title": "Chhatrapati Shivaji Maharaj Jayanti", "type": "Holiday"},
    ],
    DateTime(2026, 2, 25): [
      {"title": "Unit Test", "type": "Exam"},
    ],
    DateTime(2026, 3, 3): [
      {"title": "Holi Celebration", "type": "Festival"},
    ],
    DateTime(2026, 3, 10): [
      {"title": "Final Examination Start", "type": "Exam"},
    ],
    DateTime(2026, 4, 10): [
      {"title": "Result Declaration", "type": "Academic"},
    ],
    DateTime(2026, 4, 14): [
      {"title": "Dr. Babasaheb Ambedkar Jayanti", "type": "Holiday"},
    ],
    DateTime(2026, 5, 1): [
      {"title": "Maharashtra Day", "type": "Holiday"},
      {"title": "Summer Vacation Start", "type": "Vacation"},
    ],
    DateTime(2026, 6, 15): [
      {"title": "School Reopening", "type": "Academic"},
    ],
    DateTime(2026, 6, 21): [
      {"title": "International Yoga Day", "type": "Activity"},
    ],
    DateTime(2026, 7, 10): [
      {"title": "Tree Plantation Drive", "type": "Activity"},
    ],
    DateTime(2026, 8, 15): [
      {"title": "Independence Day", "type": "National"},
    ],
    DateTime(2026, 9, 5): [
      {"title": "Teacher's Day", "type": "Festival"},
    ],
    DateTime(2026, 9, 20): [
      {"title": "Half-Yearly Examination", "type": "Exam"},
    ],
    DateTime(2026, 10, 2): [
      {"title": "Gandhi Jayanti", "type": "National"},
    ],
    DateTime(2026, 10, 20): [
      {"title": "Dussehra", "type": "Festival"},
    ],
    DateTime(2026, 10, 28): [
      {"title": "Diwali Vacation Start", "type": "Vacation"},
    ],
    DateTime(2026, 11, 14): [
      {"title": "Children’s Day", "type": "Festival"},
    ],
    DateTime(2026, 11, 30): [
      {"title": "School Reopen After Diwali", "type": "Academic"},
    ],
    DateTime(2026, 12, 25): [
      {"title": "Christmas Day", "type": "Holiday"},
    ],
    DateTime(2026, 12, 20): [
      {"title": "Annual Sports Day", "type": "Sports"},
    ],
    DateTime(2026, 7, 25): [
      {"title": "Parent Teacher Meeting", "type": "PTM"},
    ],
        DateTime(2026, 1, 5): [{"title": "Rahul Sharma Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 1, 12): [{"title": "Sneha Patil Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 2, 3): [{"title": "Amit Joshi Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 2, 18): [{"title": "Pooja Desai Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 3, 8): [{"title": "Rohan Kulkarni Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 3, 22): [{"title": "Neha Shah Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 4, 6): [{"title": "Kunal Verma Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 4, 19): [{"title": "Anjali Mehta Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 5, 2): [{"title": "Siddharth Rao Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 5, 25): [{"title": "Priya Nair Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 6, 9): [{"title": "Arjun Singh Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 6, 18): [{"title": "Meera Iyer Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 7, 4): [{"title": "Dev Patel Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 7, 28): [{"title": "Tanvi Kapoor Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 8, 11): [{"title": "Harsh Gupta Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 8, 29): [{"title": "Ishita Jain Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 9, 7): [{"title": "Aditya Roy Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 9, 23): [{"title": "Ritika Malhotra Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 10, 10): [{"title": "Omkar Shinde Birthday", "type": "StudentBirthday"}],
    DateTime(2026, 12, 3): [{"title": "Nisha Yadav Birthday", "type": "StudentBirthday"}],

    // ================= TEACHER BIRTHDAYS (20) =================
    DateTime(2026, 1, 20): [{"title": "Mrs. Priya Madam Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 2, 10): [{"title": "Mr. Rajesh Sir Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 3, 14): [{"title": "Mrs. Kavita Madam Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 4, 2): [{"title": "Mr. Sunil Sir Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 4, 25): [{"title": "Mrs. Deepa Madam Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 5, 14): [{"title": "Mr. Anil Sir Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 5, 30): [{"title": "Mrs. Shalini Madam Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 6, 12): [{"title": "Mr. Suresh Sir Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 7, 16): [{"title": "Mrs. Ritu Madam Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 8, 5): [{"title": "Mr. Mahesh Sir Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 8, 21): [{"title": "Mrs. Lata Madam Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 9, 12): [{"title": "Mr. Nitin Sir Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 9, 29): [{"title": "Mrs. Aarti Madam Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 10, 6): [{"title": "Mr. Rohit Sir Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 10, 27): [{"title": "Mrs. Pooja Madam Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 11, 4): [{"title": "Mr. Vivek Sir Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 11, 19): [{"title": "Mrs. Seema Madam Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 12, 8): [{"title": "Mr. Ramesh Sir Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 12, 15): [{"title": "Mrs. Anita Madam Birthday", "type": "TeacherBirthday"}],
    DateTime(2026, 12, 28): [{"title": "Mr. Ajay Sir Birthday", "type": "TeacherBirthday"}],
  
  };

  List<Map<String, String>> _getEventsForDay(DateTime day) {
    return schoolEvents[DateTime(day.year, day.month, day.day)] ?? [];
  }

  Color getEventColor(String type) {
    switch (type) {
      case "StudentBirthday":
        return Colors.pink;
      case "TeacherBirthday":
        return Colors.indigo;
      case "Holiday":
        return Colors.red;
      case "Exam":
        return Colors.orange;
      case "Festival":
        return Colors.purple;
      case "Activity":
        return Colors.green;
      case "Vacation":
        return Colors.blue;
      case "PTM":
        return Colors.yellow;
      case "Sports":
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F9),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("School Calendar"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          // 📋 Scrollable Legend
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildLegendDot(Colors.red, "Holiday"),
                  buildLegendDot(Colors.orange, "Exam"),
                  buildLegendDot(Colors.purple, "Festival"),
                  buildLegendDot(Colors.green, "Activity"),
                  buildLegendDot(Colors.blue, "Vacation"),
                  buildLegendDot(Colors.yellow, "PTM"),
                  buildLegendDot(Colors.teal, "Sports"),
                   buildLegendDot(Colors.pink, "Student Bday"),
                buildLegendDot(Colors.indigo, "Teacher Bday"),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 📅 Calendar
          Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 10),
              ],
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              eventLoader: _getEventsForDay,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  if (events.isEmpty) return const SizedBox();
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: events.map((event) {
                     String type = (event as Map<String, String>?)?['type'] ?? 'Other';
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: getEventColor(type),
                          shape: BoxShape.circle,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 📋 Event List
          Expanded(
            child: ListView(
              children: _getEventsForDay(_selectedDay ?? _focusedDay)
                  .map(
                    (event) => Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: getEventColor(event["type"]!).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: getEventColor(event["type"]!),
                        ),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: getEventColor(event["type"]!),
                            radius: 6,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "${event["title"]!} (${event["type"]})",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLegendDot(Color color, String title) {
    return Row(
      children: [
        CircleAvatar(radius: 6, backgroundColor: color),
        const SizedBox(width: 4),
        Text(title, style: const TextStyle(fontSize: 12)),
        const SizedBox(width: 10),
      ],
    );
  }
}
