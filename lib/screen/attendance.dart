import 'package:flutter/material.dart';



class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: const Color(0xff4a4a4a),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Back button functional
          },
        ),
        title: const Text(
          "Attendance",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Header
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Attendance is here!",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Track your daily academic presence",
                        style:
                            TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/icons/attendance.webp",
                    height: 70,
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// Calendar Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xfff8f8f8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [

                  /// Month Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.chevron_left, size: 32),
                      Text(
                        "JANUARY 2026",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.chevron_right, size: 32),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Week Days
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      dayText("Mon"),
                      dayText("Tue"),
                      dayText("Wed"),
                      dayText("Thu"),
                      dayText("Fri"),
                      dayText("Sat"),
                      dayText("Sun"),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// Calendar Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 31,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      int day = index + 1;
                      return Column(
                        children: [
                          Text(
                            day.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: getDotColor(day),
                              shape: BoxShape.circle,
                            ),
                          )
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  /// Legend
                  Wrap(
                    spacing: 15,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: const [
                      legendDot(Colors.green, "Present"),
                      legendDot(Colors.red, "Absent"),
                      legendDot(Colors.yellow, "Late"),
                      legendDot(Colors.orange, "Half Day"),
                      legendDot(Colors.grey, "Holiday"),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// Summary Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xfff8f8f8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [
                  Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      summaryText(Colors.green, "Present: 8"),
                      summaryText(Colors.red, "Absent: 9"),
                      summaryText(Colors.yellow, "Late: 6"),
                      summaryText(Colors.orange, "Half Day: 1"),
                      summaryText(Colors.grey, "Holiday: 3"),
                      summaryText(Colors.black, "Total: 27"),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bar_chart, size: 20),
                      SizedBox(width: 6),
                      Text(
                        "Attendance Rate: 62.5%",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static Color getDotColor(int day) {
    if (day % 7 == 0) return Colors.yellow;
    if (day % 5 == 0) return Colors.red;
    if (day % 3 == 0) return Colors.green;
    if (day % 2 == 0) return Colors.orange;
    return Colors.grey;
  }
}

class dayText extends StatelessWidget {
  final String text;
  const dayText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500),
    );
  }
}

class legendDot extends StatelessWidget {
  final Color color;
  final String text;
  const legendDot(this.color, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration:
              BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}

class summaryText extends StatelessWidget {
  final Color color;
  final String text;
  const summaryText(this.color, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration:
              BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}