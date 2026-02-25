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
      home: GmeetLiveClassesScreen(),
    );
  }
}

class GmeetLiveClassesScreen extends StatelessWidget {
  const GmeetLiveClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: const Color(0xff4a4a4a),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          "Gmeet Live Classes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Header Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Your Gmeet Live Classe...",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Join your virtual classrooms",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/icons/meets.jpg",
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// Cards
            classCard(
              title: "English Classes",
              duration: "45",
              className: "Class 1 A",
              dateTime: "30/01/2026 04:30 AM",
              host: "Jason Sharlton(Teacher: 90006)",
              description: "English Classes",
            ),

            const SizedBox(height: 15),

            classCard(
              title: "Live Class",
              duration: "23",
              className: "Class 1 A",
              dateTime: "24/01/2026 04:27 PM",
              host: "aman (Teacher: 654)",
              description: "Not available",
            ),

            const SizedBox(height: 15),

            classCard(
              title: "GK Combined Online Classes",
              duration: "45",
              className: "Class 1 A",
              dateTime: "30/01/2026 04:30 AM",
              host: "Jason",
              description: "GK Classes",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static Widget classCard({
    required String title,
    required String duration,
    required String className,
    required String dateTime,
    required String host,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [

          /// Card Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xffe9ecef),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Join",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          /// Card Body
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                rowItem("Class Duration (Minutes)", duration, showLive: true),
                rowItem("Class", className),
                rowItem("Date Time", dateTime),
                rowItem("Class Host", host),
                rowItem("Description", description),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget rowItem(String title, String value,
      {bool showLive = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (showLive)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Live",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
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
}