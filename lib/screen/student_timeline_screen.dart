import 'package:flutter/material.dart';

class StudentTimelineScreen extends StatelessWidget {
  const StudentTimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef1f7),
      appBar: AppBar(
        backgroundColor: const Color(0xff2c3e50),
        title: const Text(
          "Student Timeline",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          TimelineTile(
            date: "January 8, 2026",
            title: "Science Assignment Submitted",
            status: "Submitted",
            progress: 1.0,
            color: Colors.green,
            icon: Icons.assignment_turned_in,
          ),
          TimelineTile(
            date: "January 12, 2026",
            title: "Mathematics Exam",
            status: "Scheduled",
            progress: 0.7,
            color: Colors.blue,
            icon: Icons.calculate,
          ),
          TimelineTile(
            date: "January 15, 2026",
            title: "Exam Result Published",
            status: "Score: 85%",
            progress: 0.85,
            color: Colors.purple,
            icon: Icons.emoji_events,
          ),
          TimelineTile(
            date: "January 20, 2026",
            title: "History Syllabus Completed",
            status: "Completed",
            progress: 1.0,
            color: Colors.orange,
            icon: Icons.menu_book,
          ),
          TimelineTile(
            date: "January 28, 2026",
            title: "Sports Competition Participated",
            status: "2nd Place",
            progress: 0.6,
            color: Colors.red,
            icon: Icons.sports_soccer,
          ),
        ],
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  final String date;
  final String title;
  final String status;
  final double progress;
  final Color color;
  final IconData icon;

  const TimelineTile({
    super.key,
    required this.date,
    required this.title,
    required this.status,
    required this.progress,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Left Timeline Line + Dot
        Column(
          children: [
            Container(
              width: 3,
              height: 20,
              color: color.withOpacity(0.5),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.5),
                    blurRadius: 6,
                  )
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
            Container(
              width: 3,
              height: 120,
              color: color.withOpacity(0.5),
            ),
          ],
        ),

        const SizedBox(width: 15),

        /// Right Card
        Expanded(
          child: Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade300,
                      color: color,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}