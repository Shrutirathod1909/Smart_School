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

  // Color Orbit Palette
  static const Color bgColor = Color(0xffF5F6FA);
  static const List<Color> appBarGradient = [
    Color(0xff42a5f5),
    Color(0xff7e57c2),
  ];
  static const List<Color> cardHeaderGradient = [
    Color(0xffff7043),
    Color(0xffffca28),
  ];
  static const List<Color> summaryGradient = [
    Color(0xff42e695),
    Color(0xff3bb2b8),
  ];
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
            Navigator.pop(context); // Back button functional
          },
        ),
        title: const Text(
          "CBSE Exam Result",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.calendar_today_outlined,
              color: Colors.white,
            ),
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
                        primary: Color(
                          0xff42a5f5,
                        ), // Orbit appBar gradient start color
                        onPrimary: Colors.white, // Text/icon color on header
                        onSurface: Colors.black87, // Text color on calendar
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              if (pickedDate != null) {
                // For demo, printing selected date
                debugPrint("Selected Date: $pickedDate");
                // You can update a state variable here to show selected date
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
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff42a5f5), Color(0xff7e57c2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Your CBSE Exam\nResult is here!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Check your academic\nperformance",
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.school, size: 40, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _assessmentCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: cardBgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            // HEADER GRADIENT
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xffff7043), Color(0xffffca28)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: const Text(
                "Assessment Test Chapter Wise",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _tableHeader(),
            const Divider(),
            _row("English (210)", "87.00", "xx", "87.00", Colors.blue.shade50),
            const Divider(),
            _row(
              "Science (111)",
              "83.00",
              "73.00",
              "156.00",
              Colors.purple.shade50,
            ),
            const Divider(),
            _row(
              "Mathematics (110)",
              "83.00",
              "xx",
              "83.00",
              Colors.green.shade50,
            ),
            const Divider(),
            _row("Hindi (230)", "87.00", "xx", "87.00", Colors.orange.shade50),
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
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Theory\n(Max 100)",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Practical\n(Max 75)",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Total",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(
    String subject,
    String theory,
    String practical,
    String total,
    Color bgColor,
  ) {
    return Container(
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                subject,
                style: const TextStyle(color: textColorPrimary),
              ),
            ),
            Expanded(
              child: Text(
                theory,
                textAlign: TextAlign.center,
                style: const TextStyle(color: textColorPrimary),
              ),
            ),
            Expanded(
              child: Text(
                practical,
                textAlign: TextAlign.center,
                style: const TextStyle(color: textColorPrimary),
              ),
            ),
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
      ),
    );
  }

  Widget _summaryBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: summaryGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
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
          gradient: const LinearGradient(
            colors: [Color(0xffff7043), Color(0xffffca28)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          "Monthly Periodic exam (September-2025)",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
        Text(
          title,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
