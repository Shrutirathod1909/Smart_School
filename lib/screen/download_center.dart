import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DownloadCenterScreen(),
  ));
}

class DownloadCenterScreen extends StatefulWidget {
  const DownloadCenterScreen({super.key});

  @override
  State<DownloadCenterScreen> createState() => _DownloadCenterScreenState();
}

class _DownloadCenterScreenState extends State<DownloadCenterScreen> {
  String selectedCategory = "Contents";

  // Color Orbit Palette
  final Color bgColor = const Color(0xffF5F6FA);
  final List<Color> appBarGradient = [Color(0xff42a5f5), Color(0xff7e57c2)];
  final List<Color> headerGradient = [Color(0xffff7043), Color(0xffffca28)];
  final List<Color> cardGradient1 = [Color(0xff81d4fa), Color(0xffb39ddb)];
  final List<Color> cardGradient2 = [Color(0xffffab91), Color(0xfffff59d)];
  final Color categorySelected = Color(0xff7e57c2);
  final Color categoryUnselected = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: appBarGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          "Download Center",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: headerGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Your Download Center is here!",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Download and view all your school documents and video tutorials",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.download,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// CATEGORY TEXT (WITH COLOR ORBIT)
            Row(
              children: [
                categoryText("Contents"),
                const SizedBox(width: 20),
                categoryText("Video Tutorial"),
              ],
            ),

            const SizedBox(height: 20),

            /// DATA LIST
            Expanded(
              child: ListView(
                children:
                    selectedCategory == "Contents" ? contentData() : videoData(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// CATEGORY TEXT
  Widget categoryText(String title) {
    bool isSelected = selectedCategory == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isSelected ? categorySelected : categoryUnselected,
        ),
      ),
    );
  }

  /// DOWNLOAD CARD
  Widget downloadCard({
    required String title,
    required String shareDate,
    required String validUpto,
    required String sharedBy,
    required String description,
    required String createdAt,
    bool isAlternate = false,
  }) {
    List<Color> gradientColors = isAlternate ? cardGradient2 : cardGradient1;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          /// TOP TITLE
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                  ),
                ),
                const Icon(Icons.attach_file, color: Colors.black87)
              ],
            ),
          ),

          /// DETAILS
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRow("Share Date:", shareDate),
                buildRow("Valid Upto:", validUpto),
                buildRow("Shared By:", sharedBy),
                const SizedBox(height: 8),
                const Text("Description:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(description),
                const SizedBox(height: 8),
                buildRow("Created At:", createdAt),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ROW BUILDER
  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, fontSize: 14),
          children: [
            TextSpan(
              text: "$title ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  /// CONTENT DATA
  List<Widget> contentData() {
    return [
      downloadCard(
        title: "Science Study Syllabus",
        shareDate: "01/07/2025",
        validUpto: "31/07/2025",
        sharedBy: "Joe Black (9000)",
        description: "Science Study Syllabus",
        createdAt: "01/07/2025 14:26",
        isAlternate: false,
      ),
      downloadCard(
        title: "New Books List",
        shareDate: "03/06/2025",
        validUpto: "30/06/2025",
        sharedBy: "Joe Black (9000)",
        description: "Updated book list for new academic year.",
        createdAt: "03/06/2025 09:54",
        isAlternate: true,
      ),
    ];
  }

  /// VIDEO DATA
  List<Widget> videoData() {
    return [
      downloadCard(
        title: "Fees-Structure",
        shareDate: "01/05/2025",
        validUpto: "31/05/2025",
        sharedBy: "Joe Black (9000)",
        description: "Fees structure explanation video tutorial.",
        createdAt: "01/05/2025 10:15",
        isAlternate: false,
      ),
    ];
  }
}