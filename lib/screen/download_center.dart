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
  State<DownloadCenterScreen> createState() =>
      _DownloadCenterScreenState();
}

class _DownloadCenterScreenState
    extends State<DownloadCenterScreen> {

  String selectedCategory = "Contents";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),

      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          "Download Center",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme:
            const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //////////////////////////////////////////////////////
            /// HEADER
            //////////////////////////////////////////////////////

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius:
                    BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Download Center is here!",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Download and view all your school documents and video tutorials",
                          style: TextStyle(
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius:
                          BorderRadius.circular(
                              15),
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

            //////////////////////////////////////////////////////
            /// CATEGORY TEXT (NO BUTTON STYLE)
            //////////////////////////////////////////////////////

            Row(
              children: [
                categoryText("Contents"),
                const SizedBox(width: 20),
                categoryText("Video Tutorial"),
              ],
            ),

            const SizedBox(height: 20),

            //////////////////////////////////////////////////////
            /// DATA LIST
            //////////////////////////////////////////////////////

            Expanded(
              child: ListView(
                children: selectedCategory ==
                        "Contents"
                    ? contentData()
                    : videoData(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////
  /// CATEGORY TEXT
  //////////////////////////////////////////////////////////

  Widget categoryText(String title) {
    bool isSelected =
        selectedCategory == title;

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
          color: isSelected
              ? Colors.black
              : Colors.grey,
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////
  /// DOWNLOAD CARD
  //////////////////////////////////////////////////////////

  Widget downloadCard({
    required String title,
    required String shareDate,
    required String validUpto,
    required String sharedBy,
    required String description,
    required String createdAt,
  }) {
    return Container(
      margin:
          const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color:
                Colors.grey.withOpacity(0.2),
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [

          /// TOP TITLE
          Container(
            padding:
                const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius:
                  const BorderRadius.only(
                topLeft:
                    Radius.circular(15),
                topRight:
                    Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style:
                        const TextStyle(
                      fontWeight:
                          FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(Icons.attach_file)
              ],
            ),
          ),

          /// DETAILS
          Padding(
            padding:
                const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                buildRow("Share Date:",
                    shareDate),
                buildRow("Valid Upto:",
                    validUpto),
                buildRow("Shared By:",
                    sharedBy),

                const SizedBox(height: 8),

                const Text(
                  "Description:",
                  style: TextStyle(
                      fontWeight:
                          FontWeight.bold),
                ),
                Text(description),

                const SizedBox(height: 8),

                buildRow("Created At:",
                    createdAt),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //////////////////////////////////////////////////////////
  /// ROW BUILDER
  //////////////////////////////////////////////////////////

  Widget buildRow(
      String title, String value) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
              color: Colors.black,
              fontSize: 14),
          children: [
            TextSpan(
              text: "$title ",
              style: const TextStyle(
                  fontWeight:
                      FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////
  /// CONTENT DATA
  //////////////////////////////////////////////////////////

  List<Widget> contentData() {
    return [
      downloadCard(
        title: "Science Study Syllabus",
        shareDate: "01/07/2025",
        validUpto: "31/07/2025",
        sharedBy: "Joe Black (9000)",
        description:
            "Science Study Syllabus",
        createdAt:
            "01/07/2025 14:26",
      ),
      downloadCard(
        title: "New Books List",
        shareDate: "03/06/2025",
        validUpto: "30/06/2025",
        sharedBy: "Joe Black (9000)",
        description:
            "Updated book list for new academic year.",
        createdAt:
            "03/06/2025 09:54",
      ),
    ];
  }

  //////////////////////////////////////////////////////////
  /// VIDEO DATA
  //////////////////////////////////////////////////////////

  List<Widget> videoData() {
    return [
      downloadCard(
        title: "Fees-Structure",
        shareDate: "01/05/2025",
        validUpto: "31/05/2025",
        sharedBy: "Joe Black (9000)",
        description:
            "Fees structure explanation video tutorial.",
        createdAt:
            "01/05/2025 10:15",
      ),
    ];
  }
}