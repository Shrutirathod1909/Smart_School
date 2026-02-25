import 'package:flutter/material.dart';

class BehaviourRecordScreen extends StatelessWidget {
  const BehaviourRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f4f8),
    appBar: AppBar(
  elevation: 0,
  backgroundColor: const Color.fromARGB(255, 47, 50, 52),
  centerTitle: true,
  leading: IconButton(
    icon: const Icon(
      Icons.arrow_back,
      color: Colors.white, // 👈 White Arrow
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  title: const Text(
    "Behaviour Record",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
),
   body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          BehaviourCard(
            date: "25 Jan 2026",
            teacher: "Sports Teacher",
            remark: "Outstanding discipline in sports activity",
            status: "Excellent",
          ),
          BehaviourCard(
            date: "20 Jan 2026",
            teacher: "Mrs. Patel",
            remark: "Helped classmates during project",
            status: "Good",
          ),
          BehaviourCard(
            date: "15 Jan 2026",
            teacher: "Mr. Verma",
            remark: "Late submission of homework",
            status: "Warning",
          ),
          BehaviourCard(
            date: "12 Jan 2026",
            teacher: "Mrs. Sharma",
            remark: "Excellent classroom participation",
            status: "Good",
          ),
        ],
      ),
    );
  }
}

class BehaviourCard extends StatelessWidget {
  final String date;
  final String teacher;
  final String remark;
  final String status;

  const BehaviourCard({
    super.key,
    required this.date,
    required this.teacher,
    required this.remark,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;

    switch (status) {
      case "Excellent":
        statusColor = Colors.green;
        statusIcon = Icons.star;
        break;
      case "Good":
        statusColor = Colors.blue;
        statusIcon = Icons.thumb_up;
        break;
      default:
        statusColor = Colors.orange;
        statusIcon = Icons.warning;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 4),
          )
        ],
      ),
      child: Column(
        children: [

          /// Date & Status Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(statusIcon,
                          size: 16, color: statusColor),
                      const SizedBox(width: 6),
                      Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          /// Content
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [

                /// Icon Circle
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    statusIcon,
                    size: 28,
                    color: statusColor,
                  ),
                ),

                const SizedBox(width: 15),

                /// Text Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        teacher,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        remark,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 79, 78, 78),
                        ),
                      ),
                    ],
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