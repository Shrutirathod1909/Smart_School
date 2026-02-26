import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DailyAssignmentScreen(),
  ));
}

class DailyAssignmentScreen extends StatelessWidget {
  const DailyAssignmentScreen({super.key});

  // 🎨 Color Orbit Palette
  static const Color bgColor = Color(0xfff2f2f2);
  static const Color floatingBtnColor = Color(0xffff5722); // Bright orange
  static const List<Color> headerGradient = [Color(0xff42a5f5), Color(0xff7e57c2)]; // Blue → Purple
  static const List<Color> cardHeaderGradient = [Color(0xffff7043), Color(0xffffca28)]; // Orange → Yellow
  static const Color cardBgColor = Colors.white;
  static const Color textColorPrimary = Colors.black87;
  static const Color textColorSecondary = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      // APP BAR
      appBar: AppBar(
        backgroundColor: headerGradient[0],
        title: const Text(
          "Daily Assignment",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // FLOATING BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: floatingBtnColor,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),

      // BODY
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HEADER SECTION WITH GRADIENT
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: headerGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Your Daily Assignment!",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Stay on top of your daily tasks",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),

                  // IMAGE/ICON
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.assignment, size: 40, color: Colors.white),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ASSIGNMENT LIST
            Expanded(
              child: ListView(
                children: [

                  assignmentCard(
                    subject: "English (210)",
                    title: "Technology's Impact",
                    submissionDate: "3/1/2026",
                    description:
                        "Technology has a profound and multifaceted impact on society, affecting communication, work, healthcare, and education.",
                  ),

                  const SizedBox(height: 15),

                  assignmentCard(
                    subject: "Mathematics (110)",
                    title: "Number Pattern",
                    submissionDate: "1/1/2026",
                    description:
                        "A number pattern, also known as a sequence, is a series of numbers that follow a specific rule or arrangement.",
                  ),

                  const SizedBox(height: 15),

                  assignmentCard(
                    subject: "Hindi (230)",
                    title: "कविता लेखन",
                    submissionDate: "5/1/2026",
                    description:
                        "हिंदी में एक सुंदर कविता लिखें जो प्रकृति और पर्यावरण पर आधारित हो।",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ASSIGNMENT CARD WITH COLOR ORBIT HEADER
  static Widget assignmentCard({
    required String subject,
    required String title,
    required String submissionDate,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: cardBgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // COLOR ORBIT HEADER GRADIENT
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: cardHeaderGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),

          // CARD BODY
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Title: $title",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: textColorPrimary),
                ),

                const SizedBox(height: 5),

                Text(
                  "Submission Date: $submissionDate",
                  style: const TextStyle(color: textColorSecondary),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Description:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: textColorPrimary),
                ),

                const SizedBox(height: 5),

                Text(
                  description,
                  style: const TextStyle(color: textColorPrimary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}