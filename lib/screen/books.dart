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
      home: BooksIssuedScreen(),
    );
  }
}

class BooksIssuedScreen extends StatefulWidget {
  const BooksIssuedScreen({super.key});

  @override
  State<BooksIssuedScreen> createState() => _BooksIssuedScreenState();
}

class _BooksIssuedScreenState extends State<BooksIssuedScreen> {
  int selectedTab = 0;

  // 🎨 ORBIT COLORS
  final Color blueColor = const Color(0xFF1E88E5);
  final Color redColor = const Color(0xFFE53935);
  final Color greenColor = const Color(0xFF43A047);
  final Color purpleColor = const Color(0xFF8E24AA);
  final Color orangeColor = const Color(0xFFFB8C00);
  final Color bgColor = const Color(0xFFF3F4F6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      /// ✅ APP BAR
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Books Issued",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Column(
        children: [

          /// HEADER
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Library",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text("View issued and available books",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Icon(Icons.local_library,
                    size: 50, color: orangeColor),
              ],
            ),
          ),

          /// ✅ COLORFUL TABS
          Container(
            color: Colors.white,
            child: Row(
              children: [
                _tabButton("Books Issued", 0, greenColor),
                _tabButton("Top Books", 1, purpleColor),
              ],
            ),
          ),

          /// BOOK LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: selectedTab == 0
                  ? const [
                      BookCard(
                        title: "Building With Bricks",
                        author: "David Wood",
                        bookNo: "DA23111",
                        issueDate: "01/11/2025",
                        dueDate: "15/11/2025",
                      ),
                      SizedBox(height: 20),
                      BookCard(
                        title: "Electricity & Circuits",
                        author: "John Wright",
                        bookNo: "56433",
                        issueDate: "02/01/2026",
                        dueDate: "24/01/2026",
                      ),
                    ]
                  : const [
                      /// ✅ 2 TOP BOOKS ADDED
                      BookCard(
                        title: "Mathematics Magic",
                        author: "Alan Parker",
                        bookNo: "TOP101",
                        issueDate: "—",
                        dueDate: "—",
                      ),
                      SizedBox(height: 20),
                      BookCard(
                        title: "Science Explorer",
                        author: "Maria Hill",
                        bookNo: "TOP202",
                        issueDate: "—",
                        dueDate: "—",
                      ),
                    ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔵 TAB BUTTON
  Widget _tabButton(String title, int index, Color color) {
    bool isActive = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? color : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? color : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String bookNo;
  final String issueDate;
  final String dueDate;

  const BookCard({
    super.key,
    required this.title,
    required this.author,
    required this.bookNo,
    required this.issueDate,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text("Not Returned",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _detailRow("Author:", author),
                _detailRow("Book No.:", bookNo),
                _detailRow("Issue Date:", issueDate),
                _detailRow("Due Return Date:", dueDate),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(title,
                style: const TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Text(value,
                style: const TextStyle(
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}