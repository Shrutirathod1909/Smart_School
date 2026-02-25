import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DailyAssignmentScreen(),
  ));
}

class DailyAssignmentScreen extends StatelessWidget {
  const DailyAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),

      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          "Daily Assignment",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      //////////////////////////////////////////////////////////////
      /// FLOATING BUTTON (GRAY BG + WHITE ICON)
      //////////////////////////////////////////////////////////////

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade800,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),

      //////////////////////////////////////////////////////////////
      /// BODY
      //////////////////////////////////////////////////////////////

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //////////////////////////////////////////////////////////
            /// HEADER SECTION (LIGHT GREY + IMAGE)
            //////////////////////////////////////////////////////////

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
                          "Your Daily Assignment!",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Stay on top of your daily tasks",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),

                  /// 🔥 IMAGE INSTEAD OF ICON
                  Image.asset(
                    "assets/icons/daily.webp",
                    height: 70,
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            //////////////////////////////////////////////////////////
            /// ASSIGNMENT LIST
            //////////////////////////////////////////////////////////

            Expanded(
              child: ListView(
                children: [

                  assignmentCard(
                    subject: "English (210)",
                    title: "Technology's Impact",
                    submissionDate: "3/1/2026",
                    description:
                        "Technology has a profound and multifaceted impact on society, affecting various aspects of life, from communication and work to healthcare and education.",
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

  //////////////////////////////////////////////////////////////
  /// ASSIGNMENT CARD WITH DARK TOP HEADER
  //////////////////////////////////////////////////////////////

  static Widget assignmentCard({
    required String subject,
    required String title,
    required String submissionDate,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //////////////////////////////////////////////////////////
          /// DARK GREY TOP SECTION
          //////////////////////////////////////////////////////////

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
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
                      icon: const Icon(Icons.edit,
                          color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete,
                          color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),

          //////////////////////////////////////////////////////////
          /// CARD BODY
          //////////////////////////////////////////////////////////

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Title: $title",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 5),

                Text(
                  "Submission Date: $submissionDate",
                  style: const TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Description:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                Text(
                  description,
                  style: const TextStyle(
                      color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}