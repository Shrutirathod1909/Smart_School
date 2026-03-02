import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:market/screen/home_screen.dart';

class StudentProfileScreen extends StatefulWidget {
  final String name;
  final String? studentClass;
  final String userId;
  final String role;

  const StudentProfileScreen({
    super.key,
    required this.name,
    this.studentClass,
    required this.userId,
    required this.role,
  });

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  bool isLoading = true;
  int selectedTab = 0;

  // 🔹 PROFILE VARIABLES
  String email = "";
  String phone = "";
  String gender = "";
  String dob = "";
  String bloodGroup = "";
  String religion = "";
  String category = "";
  String fatherName = "";
  String motherName = "";
  String fatherPhone = "";
  String motherPhone = "";
  String address = "";
  String city = "";
  String pincode = "";
  String state = "";
  String country = "";
  String admissionNo = "";
  String rollNo = "";
  String status = "";
  String classId = "";
  String sectionId = "";
  String medium = "";
  String feeType = "";
  String photo = "";

  // ✅ NEW
  String standard = "";
  String sectionName = "";

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      final response = await http.get(
        Uri.parse(
            "http://192.168.1.39/orbit/profile.php?user_id=${widget.userId}"),
      );

      final data = jsonDecode(response.body);

      if (data['status'] == 'success') {
        final user = data['data'];

        setState(() {
          email = user['email'] ?? "";
          phone = user['phone'] ?? "";
          gender = user['gender'] ?? "";
          dob = user['dob'] ?? ""; // ✅ FIXED
          bloodGroup = user['blood_group'] ?? "";
          religion = user['religion'] ?? "";
          category = user['category'] ?? "";
          fatherName = user['father_name'] ?? "";
          motherName = user['mother_name'] ?? "";
          fatherPhone = user['father_phone'] ?? "";
          motherPhone = user['mother_phone'] ?? "";
          address = user['address'] ?? "";
          city = user['city'] ?? "";
          pincode = user['pincode'] ?? "";
          state = user['state'] ?? "";
          country = user['country'] ?? "";
          admissionNo = user['admission_no'] ?? "";
          rollNo = user['roll_no'] ?? "";
          status = user['status'] ?? "";
          classId = user['class_id']?.toString() ?? "";
          sectionId = user['section_id']?.toString() ?? "";
          medium = user['medium']?.toString() ?? "";
          feeType = user['fee_type']?.toString() ?? "";
          photo = user['profile_image'] ?? "";

          // ✅ STANDARD + SECTION
          standard = user['standard'] ?? "";
          sectionName = user['section_name'] ?? "";

          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E88E5),
        title: const Text(
          "Student Profile",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(
                  name: widget.name,
                  studentClass: standard,
                  userId: widget.userId,
                  classId: classId,
                  sectionId: sectionId,
                  role: widget.role,
                    profile_image: photo,
                    sectionName: sectionName,
                    standard: standard,
                ),
              ),
            );
          },
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Student Profile",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "View and manage your academic profile",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      children: [

                        /// 🔹 NAME + STANDARD
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(widget.name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 6),

                                  // ✅ SHOW STANDARD PROPER
                                  Text(
                                      '$standard - $sectionName'),

                                  Text("Adm. No. $admissionNo"),
                                  Text("Roll Number $rollNo"),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: 45,
                              backgroundImage: photo.isNotEmpty
                                  ? NetworkImage(
                                      "http://10.247.221.237/orbit/$photo")
                                  : const AssetImage(
                                          'assets/icons/student.webp')
                                      as ImageProvider,
                            )
                          ],
                        ),

                        const SizedBox(height: 20),

                        /// 🔹 TABS
                        Row(
                          children: [
                            tabButton("PERSONAL", 0),
                            tabButton("PARENTS", 1),
                            tabButton("OTHER", 2),
                          ],
                        ),

                        const SizedBox(height: 20),

                        /// 🔹 TAB DATA
                        if (selectedTab == 0) ...[
                          buildRow("Date Of Birth", dob),
                          buildRow("Gender", gender),
                          buildRow("Category", category),
                          buildRow("Religion", religion),
                          buildRow("Blood Group", bloodGroup),
                        ],

                        if (selectedTab == 1) ...[
                          buildRow("Father Name", fatherName),
                          buildRow("Father Phone", fatherPhone),
                          buildRow("Mother Name", motherName),
                          buildRow("Mother Phone", motherPhone),
                          buildRow("Email", email),
                          buildRow("Phone", phone),
                        ],

                        if (selectedTab == 2) ...[
                          buildRow("Address", address),
                          buildRow("City", city),
                          buildRow("State", state),
                          buildRow("Country", country),
                          buildRow("Pincode", pincode),
                          buildRow("Status", status),

                          // ✅ REPLACED
                          buildRow("Standard", standard),
                          buildRow("Section", sectionName),

                          buildRow("Medium", medium),
                          buildRow("Fee Type", feeType),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget tabButton(String text, int index) {
    bool isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF1E88E5)
                : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Text(title,
                  style:
                      const TextStyle(fontWeight: FontWeight.w600))),
          Expanded(flex: 6, child: Text(value.isEmpty ? "-" : value)),
        ],
      ),
    );
  }
}