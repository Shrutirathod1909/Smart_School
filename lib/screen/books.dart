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
  int selectedTab = 0; // 0 = Books Issued

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      /// ✅ APP BAR (WHITE TEXT)
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Books Issued",
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Icon(Icons.menu_book_outlined, color: Colors.white),
                SizedBox(width: 6),
                Text(
                  "Books",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),

      body: Column(
        children: [

          /// HEADER
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Library",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "View issued and available books",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Icon(Icons.local_library,
                    size: 50, color: Colors.orange),
              ],
            ),
          ),

          /// ✅ TABS WITH GREEN UNDERLINE
          Container(
            color: Colors.grey.shade200,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 0;
                      });
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: selectedTab == 0
                                ? Colors.green
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Books Issued",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedTab == 0
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 1;
                      });
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: selectedTab == 1
                                ? Colors.green
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Top Books",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: selectedTab == 1
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// BOOK LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
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
              ],
            ),
          ),
        ],
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
            decoration: const BoxDecoration(
              color: Color(0xffDDE8E5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Not Returned",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
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
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style:
                  const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}