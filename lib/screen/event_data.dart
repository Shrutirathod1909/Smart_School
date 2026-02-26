
class SchoolEvent {
  final String title;
  final String type;
  final DateTime date;

  SchoolEvent({
    required this.title,
    required this.type,
    required this.date,
  });
}

// ✅ Full Year School Event Data (2026)
final Map<DateTime, List<SchoolEvent>> schoolEvents = {
  DateTime(2026, 1, 1): [
    SchoolEvent(title: "New Year’s Day", type: "Holiday", date: DateTime(2026, 1, 1)),
  ],
  DateTime(2026, 1, 14): [
    SchoolEvent(title: "Makar Sankranti", type: "Festival", date: DateTime(2026, 1, 14)),
  ],
  DateTime(2026, 1, 26): [
    SchoolEvent(title: "Republic Day", type: "National", date: DateTime(2026, 1, 26)),
  ],
  DateTime(2026, 2, 19): [
    SchoolEvent(title: "Chhatrapati Shivaji Maharaj Jayanti", type: "Holiday", date: DateTime(2026, 2, 19)),
  ],
  DateTime(2026, 3, 3): [
    SchoolEvent(title: "Holi Celebration", type: "Festival", date: DateTime(2026, 3, 3)),
  ],
  DateTime(2026, 4, 14): [
    SchoolEvent(title: "Dr. Babasaheb Ambedkar Jayanti", type: "Holiday", date: DateTime(2026, 4, 14)),
  ],
  DateTime(2026, 5, 1): [
    SchoolEvent(title: "Maharashtra Day", type: "Holiday", date: DateTime(2026, 5, 1)),
    SchoolEvent(title: "Summer Vacation Start", type: "Vacation", date: DateTime(2026, 5, 1)),
  ],
  DateTime(2026, 6, 15): [
    SchoolEvent(title: "School Reopening", type: "Academic", date: DateTime(2026, 6, 15)),
  ],
  DateTime(2026, 8, 15): [
    SchoolEvent(title: "Independence Day", type: "National", date: DateTime(2026, 8, 15)),
  ],
  DateTime(2026, 10, 2): [
    SchoolEvent(title: "Gandhi Jayanti", type: "National", date: DateTime(2026, 10, 2)),
  ],
  DateTime(2026, 12, 25): [
    SchoolEvent(title: "Christmas Day", type: "Holiday", date: DateTime(2026, 12, 25)),
  ],

  // 🎂 Student Birthdays (20)
  DateTime(2026, 1, 5): [
    SchoolEvent(title: "Rahul Sharma Birthday", type: "StudentBirthday", date: DateTime(2026, 1, 5)),
  ],
  DateTime(2026, 2, 6): [
    SchoolEvent(title: "Amit Joshi Birthday", type: "StudentBirthday", date: DateTime(2026, 2, 3)),
  ],
  DateTime(2026, 3, 8): [
    SchoolEvent(title: "Rohan Kulkarni Birthday", type: "StudentBirthday", date: DateTime(2026, 3, 8)),
  ],
  DateTime(2026, 4, 6): [
    SchoolEvent(title: "Kunal Verma Birthday", type: "StudentBirthday", date: DateTime(2026, 4, 6)),
  ],
  DateTime(2026, 5, 2): [
    SchoolEvent(title: "Siddharth Rao Birthday", type: "StudentBirthday", date: DateTime(2026, 5, 2)),
  ],
  DateTime(2026, 6, 9): [
    SchoolEvent(title: "Arjun Singh Birthday", type: "StudentBirthday", date: DateTime(2026, 6, 9)),
  ],
  DateTime(2026, 7, 4): [
    SchoolEvent(title: "Dev Patel Birthday", type: "StudentBirthday", date: DateTime(2026, 7, 4)),
  ],
  DateTime(2026, 8, 11): [
    SchoolEvent(title: "Harsh Gupta Birthday", type: "StudentBirthday", date: DateTime(2026, 8, 11)),
  ],
  DateTime(2026, 9, 7): [
    SchoolEvent(title: "Aditya Roy Birthday", type: "StudentBirthday", date: DateTime(2026, 9, 7)),
  ],
  DateTime(2026, 10, 10): [
    SchoolEvent(title: "Omkar Shinde Birthday", type: "StudentBirthday", date: DateTime(2026, 10, 10)),
  ],

  // 👩‍🏫 Teacher Birthdays (20)
  DateTime(2026, 1, 20): [
    SchoolEvent(title: "Mrs. Priya Madam Birthday", type: "TeacherBirthday", date: DateTime(2026, 1, 20)),
  ],
  DateTime(2026, 2, 26): [
    SchoolEvent(title: "Mr. Rajesh Sir Birthday", type: "TeacherBirthday", date: DateTime(2026, 2, 10)),
  ],
  DateTime(2026, 3, 14): [
    SchoolEvent(title: "Mrs. Kavita Madam Birthday", type: "TeacherBirthday", date: DateTime(2026, 3, 14)),
  ],
  DateTime(2026, 4, 2): [
    SchoolEvent(title: "Mr. Sunil Sir Birthday", type: "TeacherBirthday", date: DateTime(2026, 4, 2)),
  ],
  DateTime(2026, 5, 14): [
    SchoolEvent(title: "Mr. Anil Sir Birthday", type: "TeacherBirthday", date: DateTime(2026, 5, 14)),
  ],
  DateTime(2026, 6, 12): [
    SchoolEvent(title: "Mr. Suresh Sir Birthday", type: "TeacherBirthday", date: DateTime(2026, 6, 12)),
  ],
  DateTime(2026, 7, 16): [
    SchoolEvent(title: "Mrs. Ritu Madam Birthday", type: "TeacherBirthday", date: DateTime(2026, 7, 16)),
  ],
  DateTime(2026, 8, 5): [
    SchoolEvent(title: "Mr. Mahesh Sir Birthday", type: "TeacherBirthday", date: DateTime(2026, 8, 5)),
  ],
  DateTime(2026, 9, 12): [
    SchoolEvent(title: "Mr. Nitin Sir Birthday", type: "TeacherBirthday", date: DateTime(2026, 9, 12)),
  ],
  DateTime(2026, 12, 28): [
    SchoolEvent(title: "Mr. Ajay Sir Birthday", type: "TeacherBirthday", date: DateTime(2026, 12, 28)),
  ],
  // 🎓 Exam Events for 2026
DateTime(2026, 2, 15): [
  SchoolEvent(
    title: "Math Exam - Std X",
    type: "Exam",
    date: DateTime(2026, 2, 15),
  ),
],
DateTime(2026, 2, 16): [
  SchoolEvent(
    title: "Science Exam - Std X",
    type: "Exam",
    date: DateTime(2026, 2, 16),
  ),
],
DateTime(2026, 2, 17): [
  SchoolEvent(
    title: "English Exam - Std X",
    type: "Exam",
    date: DateTime(2026, 2, 17),
  ),
],
DateTime(2026, 3, 5): [
  SchoolEvent(
    title: "Math Exam - Std XII",
    type: "Exam",
    date: DateTime(2026, 3, 5),
  ),
],
DateTime(2026, 3, 6): [
  SchoolEvent(
    title: "Physics Exam - Std XII",
    type: "Exam",
    date: DateTime(2026, 3, 6),
  ),
],
DateTime(2026, 3, 7): [
  SchoolEvent(
    title: "Chemistry Exam - Std XII",
    type: "Exam",
    date: DateTime(2026, 3, 7),
  ),
],
DateTime(2026, 4, 20): [
  SchoolEvent(
    title: "History Exam - Std X",
    type: "Exam",
    date: DateTime(2026, 4, 20),
  ),
],
DateTime(2026, 4, 21): [
  SchoolEvent(
    title: "Geography Exam - Std X",
    type: "Exam",
    date: DateTime(2026, 4, 21),
  ),
],
DateTime(2026, 5, 10): [
  SchoolEvent(
    title: "Computer Science Exam - Std XII",
    type: "Exam",
    date: DateTime(2026, 5, 10),
  ),
],
DateTime(2026, 5, 12): [
  SchoolEvent(
    title: "Biology Exam - Std XII",
    type: "Exam",
    date: DateTime(2026, 5, 12),
  ),
],
// 📚 Academic & School Events 2026
DateTime(2026, 1, 10): [
  SchoolEvent(
    title: "Staff Meeting",
    type: "Academic",
    date: DateTime(2026, 1, 10),
  ),
],
DateTime(2026, 1, 18): [
  SchoolEvent(
    title: "Student Orientation",
    type: "Academic",
    date: DateTime(2026, 1, 18),
  ),
],
DateTime(2026, 2, 5): [
  SchoolEvent(
    title: "Science Workshop",
    type: "Academic",
    date: DateTime(2026, 2, 5),
  ),
],
DateTime(2026, 2, 20): [
  SchoolEvent(
    title: "Parent-Teacher Meeting",
    type: "Academic",
    date: DateTime(2026, 2, 20),
  ),
],
DateTime(2026, 3, 10): [
  SchoolEvent(
    title: "Math Olympiad",
    type: "Academic",
    date: DateTime(2026, 3, 10),
  ),
],
DateTime(2026, 4, 5): [
  SchoolEvent(
    title: "Inter-school Debate Competition",
    type: "Academic",
    date: DateTime(2026, 4, 5),
  ),
],
DateTime(2026, 5, 15): [
  SchoolEvent(
    title: "Annual Sports Day",
    type: "Academic",
    date: DateTime(2026, 5, 15),
  ),
],
DateTime(2026, 6, 18): [
  SchoolEvent(
    title: "Summer Camp Activity",
    type: "Academic",
    date: DateTime(2026, 6, 18),
  ),
],
DateTime(2026, 7, 12): [
  SchoolEvent(
    title: "Art & Science Exhibition",
    type: "Academic",
    date: DateTime(2026, 7, 12),
  ),
],
DateTime(2026, 8, 22): [
  SchoolEvent(
    title: "Teacher Workshop",
    type: "Academic",
    date: DateTime(2026, 8, 22),
  ),
],
DateTime(2026, 9, 5): [
  SchoolEvent(
    title: "Cultural Day Celebration",
    type: "Academic",
    date: DateTime(2026, 9, 5),
  ),
],
DateTime(2026, 10, 10): [
  SchoolEvent(
    title: "Parent-Teacher Conference",
    type: "Academic",
    date: DateTime(2026, 10, 10),
  ),
],
DateTime(2026, 11, 1): [
  SchoolEvent(
    title: "Science Fair",
    type: "Academic",
    date: DateTime(2026, 11, 1),
  ),
],
DateTime(2026, 12, 5): [
  SchoolEvent(
    title: "Year-end Review Meeting",
    type: "Academic",
    date: DateTime(2026, 12, 5),
  ),
],
};