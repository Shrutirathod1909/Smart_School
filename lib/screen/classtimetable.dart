import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClassTimetableScreen(),
  ));
}

class ClassTimetableScreen extends StatelessWidget {
  const ClassTimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String todayName = getTodayName();

    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),

      //////////////////////////////////////////////////////////
      /// APP BAR
      //////////////////////////////////////////////////////////

      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          "Class Timetable",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      //////////////////////////////////////////////////////////
      /// BODY
      //////////////////////////////////////////////////////////

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [

            //////////////////////////////////////////////////////
            /// HEADER SECTION
            //////////////////////////////////////////////////////

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
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
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Check your daily class schedule",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/icons/timetable.webp",
                    height: 70,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //////////////////////////////////////////////////////
            /// ALL DAYS
            //////////////////////////////////////////////////////

            buildDay("Monday", todayName),
            buildDay("Tuesday", todayName),
            buildDay("Wednesday", todayName),
            buildDay("Thursday", todayName),
            buildDay("Friday", todayName),
            buildDay("Saturday", todayName),
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////
  /// DAY BUILDER
  //////////////////////////////////////////////////////////

  Widget buildDay(String day, String todayName) {
    return Column(
      children: [
        daySection(
          day: day,
          isToday: day == todayName,
          timetable: sampleSchedule(day),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  //////////////////////////////////////////////////////////
  /// DAY SECTION UI (UPDATED)
  //////////////////////////////////////////////////////////

  Widget daySection({
    required String day,
    required bool isToday,
    required List<Map<String, String>> timetable,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          //////////////////////////////////////////////////////
          /// TOP SECTION (GRAY BACKGROUND)
          //////////////////////////////////////////////////////

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
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
                      fontWeight: FontWeight.bold),
                ),
                if (isToday)
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
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

          //////////////////////////////////////////////////////
          /// CONTENT SECTION (CENTER)
          //////////////////////////////////////////////////////

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [

                const Row(
                  children: [
                    Expanded(
                        child: Text("Time",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontWeight: FontWeight.bold))),
                    Expanded(
                        child: Text("Subject",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontWeight: FontWeight.bold))),
                    Expanded(
                        child: Text("Room No.",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),

                const Divider(),

                ...timetable.map(
                  (item) => Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(item["time"]!,
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text(item["subject"]!,
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text(item["room no"]!,
                                textAlign: TextAlign.center)),
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

  //////////////////////////////////////////////////////////
  /// SAMPLE DATA
  //////////////////////////////////////////////////////////

  List<Map<String, String>> sampleSchedule(String day) {
    return [
      {
        "time": "9:00 AM - 09:45 AM",
        "subject": "English (210)",
        "room no": "111"
      },
      {
        "time": "09:45 AM - 10:30 AM",
        "subject": "Hindi (230)",
        "room no": "111"
      },
      {
        "time": "10:30 AM - 11:15 AM",
        "subject": "Mathematics (110)",
        "room no": "111"
      },
      {
        "time": "11:15 AM - 12:00 PM",
        "subject": "Computer (00220)",
        "room no": "111"
      },
    ];
  }

  //////////////////////////////////////////////////////////
  /// AUTO DETECT TODAY
  //////////////////////////////////////////////////////////

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