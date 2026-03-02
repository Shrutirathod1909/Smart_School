import 'package:flutter/material.dart';
import 'package:market/screen/aboutschool.dart';
import 'package:market/screen/attendance.dart';
import 'package:market/screen/behaviour_record_screen.dart';
import 'package:market/screen/calendar_screen.dart';
import 'package:market/screen/cbseexamination.dart';
import 'package:market/screen/classtimetable.dart';
import 'package:market/screen/dailyassignment.dart';
import 'package:market/screen/download_center.dart';
import 'package:market/screen/exam.dart';
import 'package:market/screen/examination_screen.dart';
import 'package:market/screen/homework_screen.dart';
import 'package:market/screen/lessonplan.dart';
import 'package:market/screen/meet_screen.dart';
import 'package:market/screen/notifcation.dart';
import 'package:market/screen/onlinecourse.dart';
import 'package:market/screen/profile_screen.dart';
import 'package:market/screen/settings.dart';
import 'package:market/screen/student_timeline_screen.dart';
import 'package:market/screen/syllabus_status.dart';
import 'package:market/screen/teacher_review.dart';
import 'package:market/screen/zoom_screen.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final String? studentClass;
  final String userId;
  final String classId;
  final String sectionId;
  final String role; // student / taff / admin
  final String profile_image;
  final String standard;
final String sectionName;

  const HomeScreen({
    super.key,
    required this.name,
    this.studentClass,
    required this.userId,
    required this.classId,
    required this.sectionId,
    required this.role,
    required this.profile_image,
    required this.standard,
required this.sectionName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      drawer: CustomDrawer(
        name: name,
        studentClass: studentClass ?? "",
        userId: userId,
        classId: classId,
        sectionId: sectionId,
        role: role,
        profileImage: profile_image,
         standard: standard,        // ✅ pass standard
             // ✅ pass standard
        sectionName: sectionName,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.asset("assets/icons/orbit_logo.png", height: 40),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NoticeBoardScreen()),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(Icons.notifications, color: Colors.black),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(radius: 5, backgroundColor: Colors.red),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SchoolCalendarScreen()),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.calendar_month, color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            // PROFILE CARD
            GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: profile_image.isNotEmpty
                          ? NetworkImage(
                              "http://192.168.1.39/orbit/$profile_image",
                            )
                          : const AssetImage("assets/icons/student.webp")
                                as ImageProvider,
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          standard.isNotEmpty && sectionName.isNotEmpty
                              ? "$standard - $sectionName"
                              : "Class Not Assigned",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            sectionTitle("E-Learning"),
            gridSection([
              {
                "image": "assets/icons/homework.webp",
                "title": "Homework",
                "screen": HomeworkScreen(
                  classId: classId,
                  sectionId: sectionId,
                ),
              },
              {
                "image": "assets/icons/daily.webp",
                "title": "Daily Assignment",
                "screen": const DailyAssignmentScreen(),
              },
              {
                "image": "assets/icons/lesson.webp",
                "title": "Lesson Plan",
                "screen": const LessonPlanScreen(),
              },
              {
                "image": "assets/icons/exam.webp",
                "title": "Online Exam",
                "screen": const ClassSelectionScreen(),
              },
              {
                "icon": Icons.download,
                "title": "Download Center",
                "screen": const DownloadCenterScreen(),
              },
              {
                "image": "assets/icons/course.webp",
                "title": "Online Course",
                "screen": const OnlineCourseScreen(),
              },
              {
                "image": "assets/icons/zoom.webp",
                "title": "Zoom Live Classes",
                "screen": const ZoomLiveClasses(),
              },
              {
                "image": "assets/icons/meet.webp",
                "title": "Gmeet Live Classes",
                "screen": const GmeetLiveClassesScreen(),
              },
            ]),
            const SizedBox(height: 20),
            sectionTitle("Academics"),
            gridSection([
              {
                "image": "assets/icons/timetable.webp",
                "title": "Class Timetable",
                "screen": const ClassTimetableScreen(),
              },
              {
                "image": "assets/icons/syllabus.webp",
                "title": "Syllabus Status",
                "screen": const SyllabusStatusScreen(),
              },
              {
                "image": "assets/icons/attendance.webp",
                "title": "Attendance",
                "screen": AttendanceScreen(userId: userId, role: role),
              },
              {
                "image": "assets/icons/timeline.webp",
                "title": "Student Timeline",
                "screen": const StudentTimelineScreen(),
              },
              {
                "image": "assets/icons/behaviour.webp",
                "title": "Behaviour Records",
                "screen": const BehaviourRecordScreen(),
              },
              {
                "image": "assets/icons/review.webp",
                "title": "Teacher Review",
                "screen": const ProfessionalTeacherReview(),
              },
              {
                "image": "assets/icons/examination.webp",
                "title": "Examination",
                "screen": const ExaminationScreen(),
              },
              {
                "image": "assets/icons/exam.webp",
                "title": "CBSE Examination",
                "screen": const ResultScreen(),
              },
            ]),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget sectionTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  static Widget gridSection(List<Map<String, dynamic>> items) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        int crossAxisCount = width < 600 ? 3 : 4;
        double iconSize = width < 600 ? 32 : 38;
        double fontSize = width < 600 ? 12 : 13;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  final screen = item["screen"] as Widget?;
                  if (screen != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => screen),
                    );
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: iconSize + 20,
                      width: iconSize + 20,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: item["image"] != null
                            ? Image.asset(
                                item["image"],
                                height: iconSize,
                                width: iconSize,
                              )
                            : Icon(
                                item["icon"],
                                size: iconSize,
                                color: Colors.blue,
                              ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item["title"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final String name;
  final String studentClass;
  final String userId;
  final String classId;
  final String sectionId;
  final String role;
  final String profileImage;
   final String standard;       // ✅ add this
  final String sectionName;   

  const CustomDrawer({
    super.key,
    required this.name,
    required this.studentClass,
    required this.userId,
    required this.classId,
    required this.sectionId,
    required this.role,
    required this.profileImage,
    required this.standard,      // ✅ add this
    required this.sectionName, 
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/icons/student.webp"),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      studentClass,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          drawerItem(context, Icons.home, "Home", () => Navigator.pop(context)),
          drawerItem(context, Icons.person, "Profile", () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StudentProfileScreen(
                  name: name,
                  studentClass: studentClass,
                  userId: userId,
                  role: role,
                ),
              ),
            );
          }),
          drawerItem(context, Icons.settings, "Settings", () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AppSettingsScreen(
                  name: name,
                  studentClass: studentClass,
                  userId: userId,
                  classId: classId,
                  sectionId: sectionId,
                  role: role,
                  profileImage: profileImage,
                   standard: standard,        // ✅ pass standard
        sectionName: sectionName,
                ),
              ),
            );
          }),
          drawerItem(context, Icons.info_outline, "About School", () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AboutSchoolPage(
                  name: name,
                  studentClass: studentClass,
                  userId: userId,
                  classId: classId,
                  sectionId: sectionId,
                  role: role,
                  profileImage: profileImage,
                           standard: standard,        // ✅ pass standard
        section: sectionName,  
                ),
              ),
            );
          }),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              "/login",
              (route) => false,
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }
}
