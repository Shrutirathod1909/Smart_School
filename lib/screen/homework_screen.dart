import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeworkScreen extends StatefulWidget {
  final String classId;
  final String sectionId;

  const HomeworkScreen({
    super.key,
    required this.classId,
    required this.sectionId,
  });

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  bool isLoading = true;
  List homeworkList = [];

  final Color primaryColor = const Color(0xFF6A1B9A);

  @override
  void initState() {
    super.initState();

    print("CLASS ID: ${widget.classId}");
    print("SECTION ID: ${widget.sectionId}");

    fetchHomework();
  }

  Future<void> fetchHomework() async {
    try {
      final url ="http://192.168.1.39/orbit/homework.php?class_id=${widget.classId}&section_id=${widget.sectionId}";

      print("URL: $url");

      final response = await http.get(Uri.parse(url));

      print("BODY: ${response.body}");

      final data = jsonDecode(response.body);

      if (data['status'] == 'success') {
        setState(() {
          homeworkList = data['data'];
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      print("ERROR: $e");
      setState(() => isLoading = false);
    }
  }

  Widget buildCard(Map hw) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Colors.white, Colors.purple.shade50],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              hw['title'] ?? '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),

            const SizedBox(height: 10),

            // Dates Row
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: primaryColor),
                const SizedBox(width: 5),
                Text("Date: ${hw['homework_date'] ?? ''}"),
              ],
            ),

            const SizedBox(height: 5),

            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.red),
                const SizedBox(width: 5),
                Text("Due: ${hw['due_date'] ?? ''}"),
              ],
            ),

            const SizedBox(height: 5),

            Row(
              children: [
                Icon(Icons.person, size: 16, color: Colors.green),
                const SizedBox(width: 5),
                Text("By: ${hw['created_by'] ?? ''}"),
              ],
            ),

            const Divider(height: 20),

            // Description
            Text(
              hw['description'] ?? '',
              style: const TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 10),

            // Download Button
            if (hw['attachment'] != null && hw['attachment'] != "")
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Download logic
                  },
                  icon: const Icon(Icons.download),
                  label: const Text("Download"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Homework"),
        backgroundColor: primaryColor,
        elevation: 0,
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : homeworkList.isEmpty
              ? const Center(
                  child: Text(
                    "No Homework Found ❌",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: homeworkList.length,
                  itemBuilder: (context, index) {
                    return buildCard(homeworkList[index]);
                  },
                ),
    );
  }
}