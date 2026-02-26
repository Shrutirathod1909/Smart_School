import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClassTimetableScreen(),
  ));
}

class ClassTimetableScreen extends StatelessWidget {
  const ClassTimetableScreen({super.key});

  // Color Orbit Palette
  static const Color bgColor = Color(0xfff2f2f2);
  static const List<Color> appBarGradient = [Color(0xff42a5f5), Color(0xff7e57c2)]; // Blue → Purple
  static const List<Color> cardHeaderGradient = [Color(0xffff7043), Color(0xffffca28)]; // Orange → Yellow
  static const Color cardBgColor = Colors.white;
  static const Color todayBadgeColor = Color(0xff66bb6a); // Green accent
  static const Color textColorPrimary = Colors.black87;
  static const Color textColorSecondary = Colors.black54;

  @override
  Widget build(BuildContext context) {
    String todayName = getTodayName();

    return Scaffold(
      backgroundColor: bgColor,

      // APP BAR WITH GRADIENT
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
        title: const Text(
          "Class Timetable",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // BODY
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [

            // HEADER SECTION WITH COLOR ORBIT
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
                          "Class Timetable",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Check your daily class schedule",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  // ICON / IMAGE PLACEHOLDER
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.schedule, size: 40, color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // DAYS
            buildDay("Monday", todayName, 0),
            buildDay("Tuesday", todayName, 1),
            buildDay("Wednesday", todayName, 2),
            buildDay("Thursday", todayName, 3),
            buildDay("Friday", todayName, 4),
            buildDay("Saturday", todayName, 5),
          ],
        ),
      ),
    );
  }

  // BUILD EACH DAY WITH CARD HEADER ORBIT COLOR
  Widget buildDay(String day, String todayName, int index) {
    return Column(
      children: [
        daySection(
          day: day,
          isToday: day == todayName,
          timetable: sampleSchedule(day),
          gradientIndex: index,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // DAY SECTION WITH GRADIENT HEADER
  Widget daySection({
    required String day,
    required bool isToday,
    required List<Map<String, String>> timetable,
    required int gradientIndex,
  }) {
    // Generate slightly different gradient for each day
    final List<List<Color>> gradients = [
      [Color(0xffff7043), Color(0xffffca28)],
      [Color(0xff42a5f5), Color(0xff7e57c2)],
      [Color(0xff66bb6a), Color(0xff9ccc65)],
      [Color(0xffec407a), Color(0xffff8a65)],
      [Color(0xffab47bc), Color(0xff7e57c2)],
      [Color(0xffffca28), Color(0xffff7043)],
    ];

    final gradient = gradients[gradientIndex % gradients.length];

    return Container(
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // HEADER WITH GRADIENT
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                if (isToday)
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: todayBadgeColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "TODAY",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),

          // CONTENT SECTION
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [

                // TABLE HEADER
                const Row(
                  children: [
                    Expanded(
                        child: Text("Time",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87))),
                    Expanded(
                        child: Text("Subject",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87))),
                    Expanded(
                        child: Text("Room No.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87))),
                  ],
                ),

                const Divider(),

                // ROWS
                ...timetable.map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(item["time"]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: textColorPrimary))),
                        Expanded(
                            child: Text(item["subject"]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: textColorPrimary))),
                        Expanded(
                            child: Text(item["room no"]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: textColorPrimary))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // SAMPLE DATA
  List<Map<String, String>> sampleSchedule(String day) {
    return [
      {"time": "9:00 AM - 09:45 AM", "subject": "English (210)", "room no": "111"},
      {"time": "09:45 AM - 10:30 AM", "subject": "Hindi (230)", "room no": "111"},
      {"time": "10:30 AM - 11:15 AM", "subject": "Mathematics (110)", "room no": "111"},
      {"time": "11:15 AM - 12:00 PM", "subject": "Computer (00220)", "room no": "111"},
    ];
  }

  // AUTO DETECT TODAY
  static String getTodayName() {
    int weekday = DateTime.now().weekday;

    const days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    return days[weekday - 1];
  }
}