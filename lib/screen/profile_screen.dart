import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  int selectedTab = 0;

  // 🎨 Royal Blue Theme Colors
  final Color primaryBlue = const Color(0xff1E3A8A);
  final Color lightBlue = const Color(0xffDBEAFE);
  final Color backgroundColor = const Color(0xffEEF3FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Student Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryBlue,
        leading: const BackButton(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'View and manage your academic profile',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Main Profile Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    /// 👤 Name & Avatar
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Edward Thomas',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('Class 1 (A) (2025-26)'),
                              Text('Adm. No. 18001'),
                              Text('Roll Number 100035'),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/icons/student.webp'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 📦 Small Info Boxes
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _smallInfoBox(
                            title: 'Barcode',
                            icon: Icons.qr_code,
                            child: BarcodeWidget(
                              barcode: Barcode.code128(),
                              data: '18001',
                              width: 80,
                              height: 30,
                            ),
                          ),
                          const SizedBox(width: 12),
                          _smallInfoBox(
                            title: 'QR Code',
                            icon: Icons.qr_code_2,
                            child: BarcodeWidget(
                              barcode: Barcode.qrCode(),
                              data: '18001',
                              width: 60,
                              height: 60,
                            ),
                          ),
                          const SizedBox(width: 12),
                          _smallInfoBox(
                            title: 'Behaviour Score',
                            icon: Icons.star,
                            child: const Text(
                              '60',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// 🔘 Tabs
                    Row(
                      children: [
                        _tabButton("PERSONAL", 0),
                        const SizedBox(width: 8),
                        _tabButton("PARENTS", 1),
                        const SizedBox(width: 8),
                        _tabButton("OTHER", 2),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 📋 Details Section
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _detailsColumn([
                            'Admission Date:',
                            'Date Of Birth:',
                            'Gender:',
                            'Category:',
                          ]),
                          _detailsColumn([
                            '04/04/2025',
                            '24/10/2013',
                            'Male',
                            'General',
                          ]),
                          _detailsColumn([
                            'Religion:',
                            'Email:',
                            'Blood Group:',
                            'Height:',
                          ]),
                          _detailsColumn([
                            'N/A',
                            'nathan455@gmail.com',
                            'A+',
                            '60 cm',
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Small Info Box
  Widget _smallInfoBox({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: primaryBlue, size: 22),
          const SizedBox(height: 6),
          child,
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: primaryBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Tab Button
  Widget _tabButton(String title, int index) {
    bool isSelected = selectedTab == index;

    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedTab = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? primaryBlue : const Color(0xff93C5FD),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(title),
      ),
    );
  }

  /// 🔹 Details Column
  Widget _detailsColumn(List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    e,
                    style: const TextStyle(fontSize: 14),
                  ),
                ))
            .toList(),
      ),
    );
  }
}