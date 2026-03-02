import 'package:flutter/material.dart';
import 'package:market/screen/books.dart';
import 'package:market/screen/fees.dart';
import 'package:market/screen/home_screen.dart';
import 'package:market/screen/transport_screen.dart';

class AboutSchoolPage extends StatelessWidget {
  final String name;
  final String? studentClass;
  final String userId;
  final String classId;      // ✅ add this
  final String sectionId;  
  final String role;  // ✅ add this
  final String profileImage;
  final String standard;
  final String section;
  

  const AboutSchoolPage({
    super.key,
    required this.name,
    this.studentClass,
    required this.userId,
    required this.classId,
    required this.sectionId,
    required this.role,
    required this.profileImage,
    required this.section,
    required this.standard
  });

  static const Color backgroundColor = Color(0xFFF2F4F7);
  static const Color appBarColor = Color(0xFF505B63);
  static const Color feesColor = Color(0xFFD6EAF8);
  static const Color booksColor = Color(0xFFD5F5E3);
  static const Color transportColor = Color(0xFFFADBD8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
  title: const Text(
    "About School",
    style: TextStyle(color: Color.fromARGB(255, 19, 18, 18), fontWeight: FontWeight.w600),
  ),
  centerTitle: true,
  leading: IconButton(
  icon: const Icon(Icons.arrow_back, color: Colors.black),
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          name: name,
          studentClass:studentClass ?? "",
           userId:userId,
            classId: classId,
      sectionId: sectionId,
      role: role,
     profile_image: profileImage,
      standard: standard,   // ✅ pass it
  sectionName: section, 
  
        ),
      ),
    );
  },
),
),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Fees Card (Navigation Added)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FeesScreen()),
                );
              },
              child: infoCard(
                title: "Fees",
                subtitle: "View fee structure and payment details",
                icon: Icons.account_balance_wallet,
                color: feesColor,
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BooksIssuedScreen(),
                  ),
                );
              },
              child: infoCard(
                title: "Books Issued",
                subtitle: "Check books issued to students",
                icon: Icons.menu_book,
                color: booksColor,
              ),
            ),

            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransportRoutesScreen(),
                  ),
                );
              },
              child: infoCard(
                title: "Transport Routes",
                subtitle: "View bus routes and transport details",
                icon: Icons.directions_bus,
                color: transportColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget infoCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, size: 30, color: Colors.black87),
          ),
          const SizedBox(width: 18),
          Expanded(
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
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 18,color: Colors.white,),
        ],
      ),
    );
  }
}
