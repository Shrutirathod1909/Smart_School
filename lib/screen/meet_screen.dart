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

  // Color Orbit Palette
  static const Color bgColor = Color(0xffF5F6FA);
  static const List<Color> appBarGradient = [Color(0xff42a5f5), Color(0xff7e57c2)];
  static const List<Color> cardHeaderGradient = [Color(0xffff7043), Color(0xffffca28)];
  static const List<Color> liveBadgeGradient = [Color(0xfff44336), Color(0xffff5252)];
  static const Color cardBgColor = Colors.white;
  static const Color textColorPrimary = Colors.black87;
  static const Color textColorSecondary = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
     appBar: AppBar(
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: appBarGradient,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  elevation: 0,
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      Navigator.pop(context); // <-- Makes the back button responsive
    },
  ),
  title: const Text(
    "Gmeet Live Classes",
    style: TextStyle(color: Colors.white),
  ),
),    body: SingleChildScrollView(
        child: Column(
          children: [

            /// Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: appBarGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Your Gmeet Live Classes are here!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Join your virtual classrooms",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.video_call, size: 40, color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            /// Class Cards
            classCard(
              title: "English Classes",
              duration: "45",
              className: "Class 1 A",
              dateTime: "30/01/2026 04:30 AM",
              host: "Jason Sharlton (Teacher: 90006)",
              description: "English Classes",
              isLive: true,
            ),

            const SizedBox(height: 15),

            classCard(
              title: "Live Class",
              duration: "23",
              className: "Class 1 A",
              dateTime: "24/01/2026 04:27 PM",
              host: "Aman (Teacher: 654)",
              description: "Not available",
              isLive: false,
            ),

            const SizedBox(height: 15),

            classCard(
              title: "GK Combined Online Classes",
              duration: "45",
              className: "Class 1 A",
              dateTime: "30/01/2026 04:30 AM",
              host: "Jason",
              description: "GK Classes",
              isLive: true,
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
    bool isLive = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: cardBgColor,
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
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: cardHeaderGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Text(
                  "Join",
                  style: TextStyle(
                      color: isLive ? Colors.white : Colors.white70,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          /// Card Body
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                rowItem("Class Duration (Minutes)", duration, showLive: isLive),
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

  static Widget rowItem(String title, String value, {bool showLive = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(title, style: const TextStyle(fontSize: 14)),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Text(value,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                if (showLive)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: liveBadgeGradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
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