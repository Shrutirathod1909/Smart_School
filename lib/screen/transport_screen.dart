import 'package:flutter/material.dart';

class TransportRoutesScreen extends StatelessWidget {
  const TransportRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        iconTheme: const IconThemeData(color: Colors.white), // back icon white
        title: const Text(
          "Transport Routes",
          style: TextStyle(color: Colors.white), // text white
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
                    children: const [
                      Text(
                        "Transport",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Track your school transport routes",
                        style: TextStyle(color: Colors.grey),
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
                children: const [
                  RouteCard(
                    title: "Brooklyn West",
                    distance: "10.0",
                    time: "12:30 PM",
                  ),
                  SizedBox(height: 20),
                  RouteCard(
                    title: "Brooklyn North",
                    distance: "20.0",
                    time: "11:00 AM",
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
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
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

  const RouteCard({
    super.key,
    required this.title,
    required this.distance,
    required this.time,
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
                border: Border.all(width: 3, color: Colors.black),
              ),
            ),
            Container(width: 2, height: 100, color: Colors.grey[400]),
          ],
        ),
        const SizedBox(width: 12),

        // Card
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffd9ecec),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.directions_bus, size: 20),
                    const SizedBox(width: 8),
                    Text("Distance(km)"),
                    const Spacer(),
                    Text(distance),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 20),
                    const SizedBox(width: 8),
                    Text("Pickup Time"),
                    const Spacer(),
                    Text(time),
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
