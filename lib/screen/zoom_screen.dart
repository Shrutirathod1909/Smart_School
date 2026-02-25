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
      home: ZoomLiveClasses(),
    );
  }
}

class ZoomLiveClasses extends StatelessWidget {
  const ZoomLiveClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Zoom Live Classes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // 🔹 Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Your Zoom Live Classes!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Join your Zoom virtual classes",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  // 🔹 Circular Zoom Image
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF4A90E2),
                          Color(0xFF007AFF)
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.videocam,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 Class Card
            buildClassCard(
              title: "Maths Discussion",
              className: "Class 1 A",
              dateTime: "30/01/2026 03:00 AM",
              duration: "45 Minutes",
              host: "Albert Thomas (Teacher: 54545454)",
              description: "Maths Discussion",
            ),

            const SizedBox(height: 20),

            buildClassCard(
              title: "EVS Extra Classes",
              className: "Class 1 A",
              dateTime: "20/01/2026 12:00 PM",
              duration: "45 Minutes",
              host: "Jason Sharlton (Teacher: 90006)",
              description: "EVS Extra Classes",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildClassCard({
    required String title,
    required String className,
    required String dateTime,
    required String duration,
    required String host,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          children: [

            // Card Header
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
              decoration: const BoxDecoration(
                color: Color(0xFFEFEFEF),
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16)),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Join"),
                  )
                ],
              ),
            ),

            // Card Body
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  buildRow("Class:", className),
                  buildRow("Date Time:", dateTime),
                  buildRow("Class Duration:", duration),
                  buildRow("Class Host:", host),
                  buildRow("Description:", description),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.red),
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Live",
                        style: TextStyle(
                            color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}