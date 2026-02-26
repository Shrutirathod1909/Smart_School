import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// 🎨 THEME COLORS
const Color headerBlue = Color(0xFF2196F3); // light blue
const Color royalBlue = Color(0xFF3F51B5); // royal blue
const Color joinGreen = Color(0xFF2E7D32);  // join button
const Color liveBlue = Color(0xFF1E88E5);   // live badge
const Color lightBg = Color(0xFFF0F4FF);    // background

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
      backgroundColor: lightBg,

      /// 🌊 Gradient AppBar
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
         leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Back button functional
          },
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [headerBlue, royalBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          "Zoom Live Classes",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header Section
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [headerBlue, royalBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Zoom Live Classes!",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Join your virtual classes seamlessly",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.videocam,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            buildClassCard(
              title: "Maths Discussion",
              className: "Class 1 A",
              dateTime: "30/01/2026 03:00 AM",
              duration: "45 Minutes",
              host: "Albert Thomas (Teacher: 54545454)",
              description: "Discussion on algebra and geometry.",
            ),

            const SizedBox(height: 20),

            buildClassCard(
              title: "EVS Extra Classes",
              className: "Class 1 A",
              dateTime: "20/01/2026 12:00 PM",
              duration: "45 Minutes",
              host: "Jason Sharlton (Teacher: 90006)",
              description: "Environment and sustainability topics.",
            ),

            const SizedBox(height: 30),
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
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: royalBlue.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(2, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            /// Card Header
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [headerBlue, royalBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),

                  /// Join Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: joinGreen,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Join",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),

            /// Card Body
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  buildRow("Class:", className),
                  buildRow("Date Time:", dateTime),
                  buildRow("Duration:", duration),
                  buildRow("Host:", host),
                  buildRow("Description:", description),
                  const SizedBox(height: 12),

                  /// Live Badge
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: liveBlue,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: liveBlue.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Live",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.black87),
            ),
          )
        ],
      ),
    );
  }
}