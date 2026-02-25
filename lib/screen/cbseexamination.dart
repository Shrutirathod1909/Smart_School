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
      home: ResultScreen(),
    );
  }
}

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
     appBar: AppBar(
  backgroundColor: const Color(0xff4A4A4A), // Same dark color
  elevation: 0,
  leading: const Icon(Icons.arrow_back, color: Colors.white),
  title: const Text(
    "CBSE Exam Result",
    style: TextStyle(color: Colors.white),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.calendar_today_outlined,
          color: Colors.white),
      onPressed: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Color(0xff4A4A4A), // Header color
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickedDate != null) {
          print("Selected Date: $pickedDate");
        }
      },
    ),
    const Padding(
      padding: EdgeInsets.only(right: 12),
      child: Center(
        child: Text(
          "Exam Schedule",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ],
),
     body: SingleChildScrollView(
        child: Column(
          children: [
            _topSection(),
            const SizedBox(height: 15),
            _assessmentCard(),
            const SizedBox(height: 20),
            _monthlySection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _topSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your CBSE Exam\nResult is here!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Check your academic\nperformance",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.school,
              size: 40,
              color: Colors.teal,
            ),
          )
        ],
      ),
    );
  }

  Widget _assessmentCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: Color(0xffE6F2EA),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: const Text(
                "Assessment Test Chapter Wise",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _tableHeader(),
            const Divider(),
            _row("English (210)", "87.00", "xx", "87.00"),
            const Divider(),
            _row("Science (111)", "83.00", "73.00", "156.00"),
            const Divider(),
            _row("Mathematics (110)", "83.00", "xx", "83.00"),
            const Divider(),
            _row("Hindi (230)", "87.00", "xx", "87.00"),
            const SizedBox(height: 15),
            _summaryBox(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _tableHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "Subject",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(
              "Theory\n(Max 100)",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
          Expanded(
            child: Text(
              "Practical\n(Max 75)",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
          Expanded(
            child: Text(
              "Total",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String subject, String theory, String practical, String total) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(subject)),
          Expanded(
              child: Text(theory, textAlign: TextAlign.center)),
          Expanded(
              child: Text(practical, textAlign: TextAlign.center)),
          Expanded(
            child: Text(
              total,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xffEAF4FF),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xffC7E0FF)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _SummaryItem("Total Marks", "413/475"),
            _SummaryItem("Percentage", "86.95%"),
            _SummaryItem("Grade", "A"),
            _SummaryItem("Rank", "1"),
          ],
        ),
      ),
    );
  }

  Widget _monthlySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffE6F2EA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          "Monthly Periodic exam (September-2025)",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String value;

  const _SummaryItem(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 13)),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}