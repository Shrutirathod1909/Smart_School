import 'package:flutter/material.dart';

/// 🎨 NEW ATTRACTIVE COLORS
class AppColors {
  static const Color primaryBlue = Color(0xff2962FF);
  static const Color primaryPurple = Color(0xff7B1FA2);
  static const Color successGreen = Color(0xff00C853);
  static const Color warningOrange = Color(0xffFF6D00);
  static const Color dangerRed = Color(0xffD50000);
  static const Color lightBg = Color(0xffF3F0FF);
}

class SyllabusStatusScreen extends StatelessWidget {
  const SyllabusStatusScreen({super.key});

  final List<Map<String, dynamic>> subjects = const [
    {
      "name": "Mathematics",
      "status": "Completed",
      "progress": 0.9,
      "image": "assets/icons/math.webp",
      "color": AppColors.successGreen
    },
    {
      "name": "Science",
      "status": "In Progress",
      "progress": 0.6,
      "image": "assets/icons/Science.webp",
      "color": AppColors.warningOrange
    },
    {
      "name": "English",
      "status": "Pending",
      "progress": 0.3,
      "image": "assets/icons/english.webp",
      "color": AppColors.dangerRed
    },
    {
      "name": "Marathi",
      "status": "Pending",
      "progress": 0.3,
      "image": "assets/icons/marathi.webp",
      "color": AppColors.dangerRed
    },
    {
      "name": "Hindi",
      "status": "Pending",
      "progress": 0.3,
      "image": "assets/icons/hindi.webp",
      "color": AppColors.dangerRed
    },
    {
      "name": "History",
      "status": "Completed",
      "progress": 1.0,
      "image": "assets/icons/History.jpg",
      "color": AppColors.successGreen
    },
    {
      "name": "Geography",
      "status": "In Progress",
      "progress": 0.5,
      "image": "assets/icons/Geography.webp",
      "color": AppColors.warningOrange
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,

      /// 🔵🟣 Gradient AppBar
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryBlue,
                AppColors.primaryPurple,
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Syllabus Status",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          var subject = subjects[index];

          return Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            margin: const EdgeInsets.only(bottom: 18),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [

                  /// Subject Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      subject["image"],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 16),

                  /// Subject Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          subject["name"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryPurple,
                          ),
                        ),

                        const SizedBox(height: 8),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: subject["progress"],
                            color: subject["color"],
                            backgroundColor:
                                subject["color"].withOpacity(0.15),
                            minHeight: 10,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          subject["status"],
                          style: TextStyle(
                            color: subject["color"],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}