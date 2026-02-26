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
      home: TransportRoutesScreen(),
    );
  }
}

class TransportRoutesScreen extends StatelessWidget {
  const TransportRoutesScreen({super.key});

  // 🎨 Color Palette
  final Color primaryBlue = const Color(0xFF1E88E5);
  final Color primaryGreen = const Color(0xFF43A047);
  final Color primaryOrange = const Color(0xFFFB8C00);
  final Color cardBlue = const Color(0xFFD9ECEC);
  final Color bgGrey = const Color(0xFFF2F2F2);
  final Color timelineGrey = const Color(0xFFB0BEC5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Transport Routes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transport",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Track your school transport routes",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Image.network(
                    "https://pngimg.com/uploads/bus/small/bus_PNG8617.png",
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Route Info Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                children: const [
                  InfoRow("Route Title", "Brooklyn West"),
                  InfoRow("Vehicle Number", "VH4584"),
                  InfoRow("Vehicle Model", "Ford CAB"),
                  InfoRow("Driver Name", "Jasper"),
                  InfoRow("Driver Contact", "8521479630"),
                  InfoRow("Driver Licence", "258714545"),
                  InfoRow("Made", "2015"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Timeline Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  RouteCard(
                    title: "Brooklyn West",
                    distance: "10.0",
                    time: "12:30 PM",
                    primaryBlue: primaryBlue,
                    cardBlue: cardBlue,
                    timelineGrey: timelineGrey,
                  ),
                  const SizedBox(height: 20),
                  RouteCard(
                    title: "Brooklyn North",
                    distance: "20.0",
                    time: "11:00 AM",
                    primaryBlue: primaryBlue,
                    cardBlue: cardBlue,
                    timelineGrey: timelineGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class RouteCard extends StatelessWidget {
  final String title;
  final String distance;
  final String time;
  final Color primaryBlue;
  final Color cardBlue;
  final Color timelineGrey;

  const RouteCard({
    super.key,
    required this.title,
    required this.distance,
    required this.time,
    required this.primaryBlue,
    required this.cardBlue,
    required this.timelineGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline Indicator
        Column(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(width: 3, color: primaryBlue),
              ),
            ),
            Container(width: 2, height: 100, color: timelineGrey),
          ],
        ),
        const SizedBox(width: 12),

        // Card
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.directions_bus, size: 20, color: primaryBlue),
                    const SizedBox(width: 8),
                    Text("Distance(km)", style: TextStyle(color: primaryBlue)),
                    const Spacer(),
                    Text(distance,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: primaryBlue)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 20, color: primaryBlue),
                    const SizedBox(width: 8),
                    Text("Pickup Time", style: TextStyle(color: primaryBlue)),
                    const Spacer(),
                    Text(time,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: primaryBlue)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}