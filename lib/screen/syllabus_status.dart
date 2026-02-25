import 'package:flutter/material.dart';

class SyllabusStatusScreen extends StatelessWidget {
  const SyllabusStatusScreen({super.key});

  final List<Map<String, dynamic>> subjects = const [
    {
      "name": "Mathematics",
      "status": "Completed",
      "progress": 0.9,
      "image": "assets/icons/math.webp", // Add your local image
      "color": Colors.green
    },
    {
      "name": "Science",
      "status": "In Progress",
      "progress": 0.6,
      "image": "assets/icons/Science.webp",
      "color": Colors.orange
    },
    {
      "name": "English",
      "status": "Pending",
      "progress": 0.3,
      "image": "assets/icons/english.webp",
      "color": Colors.red
    },
    {
      "name": "Marathi",
      "status": "Pending",
      "progress": 0.3,
      "image": "assets/icons/marathi.webp",
      "color": Color.fromARGB(255, 244, 92, 143)
    },
    {
      "name": "Hindi",
      "status": "Pending",
      "progress": 0.3,
      "image": "assets/icons/hindi.webp",
      "color": Color.fromARGB(255, 86, 144, 246)
    },
    {
      "name": "History",
      "status": "Completed",
      "progress": 1.0,
      "image": "assets/icons/History.jpg",
      "color": Colors.green
    },
    {
      "name": "Geography",
      "status": "In Progress",
      "progress": 0.5,
      "image": "assets/icons/Geography.webp",
      "color": Colors.orange
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6f9),
      appBar: AppBar(
        backgroundColor: const Color(0xff424242),
        centerTitle: true,
        title: const Text(
          "Syllabus Status",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          var subject = subjects[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Subject Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      subject["image"],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Subject Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subject["name"],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: subject["progress"],
                          color: subject["color"],
                          backgroundColor: Colors.grey.shade300,
                          minHeight: 8,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          subject["status"],
                          style: TextStyle(
                              color: subject["color"],
                              fontWeight: FontWeight.bold),
                        )
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