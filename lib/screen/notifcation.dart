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
      home: NoticeBoardScreen(),
    );
  }
}

class NoticeBoardScreen extends StatelessWidget {
  const NoticeBoardScreen({super.key});

  // 🎨 Orbit Theme Colors
  static const Color appBarColor = Color(0xFF1E88E5);
  static const Color screenBg = Color(0xFFF4F6F9);
  static const Color cardHeaderColor = Color(0xFFE3F2FD);
  static const Color greyText = Color(0xFF7A7A7A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBg,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Notice Board",
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.refresh, color: Colors.white),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Notice Board",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 4),
            const Text(
              "Stay updated with latest announcements",
              style: TextStyle(color: greyText),
            ),

            const SizedBox(height: 20),

            noticeCard(
              title: "Extra class for Std - X to XII",
              description:
                  "Dear Students, There is extra class of Science and Mathematics-I for Std X and XII (A & B) from 15th January to 20th January (2026)",
              publishDate: "15/01/2026",
              noticeDate: "12/01/2026",
              author: "Joe Black (9000)",
            ),

            const SizedBox(height: 20),

            noticeCard(
              title: "Student Health Check-up",
              description:
                  "To assess normal development of the child.\nTo keep track of immunization schedule.\nEarly detection of disease / abnormalities.",
              publishDate: "12/01/2026",
              noticeDate: "08/01/2026",
              author: "Maria Ford (9005)",
            ),
          ],
        ),
      ),
    );
  }

  // 🔷 NOTICE CARD
  static Widget noticeCard({
    required String title,
    required String description,
    required String publishDate,
    required String noticeDate,
    required String author,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔷 Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: cardHeaderColor,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  description,
                  style: const TextStyle(
                      color: Colors.black87, height: 1.5),
                ),

                const SizedBox(height: 16),

                // 🟢 Publish Date Chip
                infoChip(
                  "Publish: $publishDate",
                  Colors.green.shade100,
                ),

                const SizedBox(height: 10),

                // 🟠 Notice Date Chip
                infoChip(
                  "Notice: $noticeDate",
                  Colors.orange.shade100,
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(Icons.person,
                        size: 18, color: greyText),
                    const SizedBox(width: 6),
                    Text(
                      "By: $author",
                      style: const TextStyle(color: greyText),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // 🔷 Date Chip Widget
  static Widget infoChip(String text, Color bgColor) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.calendar_today,
              size: 16, color: Colors.black54),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}