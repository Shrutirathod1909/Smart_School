import 'package:flutter/material.dart';

class HomeworkScreen extends StatefulWidget {
  const HomeworkScreen({super.key});

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  String selectedStatus = "Submitted";
  String selectedFilter = "All";

  // Colors inspired by the Orbit Science logo
  final Color orbitRed = const Color(0xFFD32F2F);
  final Color orbitBlue = const Color(0xFF1976D2);
  final Color orbitGreen = const Color(0xFF388E3C);
  final Color orbitOrange = const Color(0xFFFB8C00);
  final Color orbitPurple = const Color(0xFF7B1FA2);
  final Color cardBackground = const Color(0xFFF5F5F5);
  final Color textBlack = Colors.black87;

  List<Map<String, dynamic>> homeworkList = [
    {
      "subject": "Mathematics",
      "code": "110",
      "homeworkDate": "01/01/2026",
      "submissionDate": "02/01/2026",
      "createdBy": "1 (ID: 1)",
      "maxMarks": "30.00",
      "file": "1768439585-107880694569683f21d206d!img.png",
    },
    {
      "subject": "Computer",
      "code": "00220",
      "homeworkDate": "22/01/2026",
      "submissionDate": "02/01/2026",
      "createdBy": "1 (ID: 1)",
      "maxMarks": "30.00",
      "file": "1768025866-18638547036961ef0aa25a8!Screen.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter homework list by selectedFilter (simple filter by subject)
    List<Map<String, dynamic>> filteredHomework = homeworkList.where((hw) {
      return selectedFilter == "All" || hw['subject'] == selectedFilter;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Homework",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: orbitPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Homework is here!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: orbitBlue,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Track your assignments and submissions",
              style: TextStyle(color: textBlack),
            ),
            const SizedBox(height: 15),

            // Status Tabs with horizontal scroll
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  statusButton("Pending", orbitOrange),
                  const SizedBox(width: 8),
                  statusButton("Submitted", orbitGreen),
                  const SizedBox(width: 8),
                  statusButton("Evaluated", orbitBlue),
                  const SizedBox(width: 15),
                  DropdownButton<String>(
                    value: selectedFilter,
                    items: <String>['All', 'Mathematics', 'Science', 'Computer']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFilter = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Homework Cards
            Expanded(
              child: ListView.builder(
                itemCount: filteredHomework.length,
                itemBuilder: (context, index) {
                  final hw = filteredHomework[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: cardBackground,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: orbitPurple.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      border: Border.all(color: orbitPurple.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header with subject and Resubmit
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${hw['subject']} (${hw['code']})",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: orbitRed,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: orbitBlue,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                "RESUBMIT",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Homework details
                        Text("Homework Date: ${hw['homeworkDate']}",
                            style: TextStyle(color: textBlack)),
                        Text("Submission Date: ${hw['submissionDate']}",
                            style: TextStyle(color: textBlack)),
                        Text("Created By: ${hw['createdBy']}",
                            style: TextStyle(color: textBlack)),
                        Text("Max Marks: ${hw['maxMarks']}",
                            style: TextStyle(color: textBlack)),
                        const SizedBox(height: 10),

                        // Submission row
                        const Text(
                          "My Submission:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                hw['file'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: textBlack),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.download,
                                size: 18,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Download",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: orbitGreen,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                textStyle: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Description: Submit homework before last date.",
                          style: TextStyle(
                            color: textBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statusButton(String status, Color color) {
    bool isSelected = selectedStatus == status;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStatus = status;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          status,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}