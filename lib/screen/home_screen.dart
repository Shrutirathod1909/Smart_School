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



/// HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      drawer: const CustomDrawer(),

    appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 0,
  centerTitle: true,
  title: Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/icons/orbit_logo.png",
          height: 40,
        ),
        const SizedBox(width: 8),
      ],
    ),
  ),
  actions: [
    // Notification Icon
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NoticeBoardScreen(),
          ),
        );
      },
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
            child: CircleAvatar(
              radius: 5,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    ),

    // Calendar Icon
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SchoolCalendarScreen(),
          ),
        );
      },
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

            /// PROFILE CARD
            Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/icons/student.webp"),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Edward Thomas",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Class 1 (A)",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            /// E-LEARNING
            sectionTitle("E-Learning"),
            gridSection([
              {
                "image": "assets/icons/homework.webp",
                "title": "Homework",
                "screen": const HomeworkScreen(),
              },
              {"image": "assets/icons/daily.webp", "title": "Daily Assignment","screen": const  DailyAssignmentScreen()},
              {"image": "assets/icons/lesson.webp", "title": "Lesson Plan","screen": const  LessonPlanScreen()},
              {"image": "assets/icons/exam.webp", "title": "Online Exam","screen": const  ClassSelectionScreen()},
              {"icon": Icons.download, "title": "Download Center","screen": const  DownloadCenterScreen()},
              {"image": "assets/icons/course.webp", "title": "Online Course","screen": const  OnlineCourseScreen()},
              {"image": "assets/icons/zoom.webp", "title": "Zoom Live Classes","screen": const   ZoomLiveClasses()},
              {"image": "assets/icons/meet.webp", "title": "Gmeet Live Classes","screen": const   GmeetLiveClassesScreen()},
            ]),

            const SizedBox(height: 20),

            /// ACADEMICS
            sectionTitle("Academics"),
            gridSection([
              {"image": "assets/icons/timetable.webp", "title": "Class Timetable","screen": const  ClassTimetableScreen()},
              {"image": "assets/icons/syllabus.webp", "title": "Syllabus Status","screen": const  SyllabusStatusScreen()},
              {"image": "assets/icons/attendance.webp", "title": "Attendance","screen": const  AttendanceScreen()},
              {"image": "assets/icons/timeline.webp", "title": "Student Timeline","screen": const  StudentTimelineScreen()},
              {"image": "assets/icons/behaviour.webp", "title": "Behaviour Records","screen": const  BehaviourRecordScreen()},
              {"image": "assets/icons/review.webp", "title": "Teacher Review","screen": const  ProfessionalTeacherReview()},
              {"image": "assets/icons/examination.webp", "title": "Examination","screen": const  ExaminationScreen()},
              {"image": "assets/icons/exam.webp", "title": "CBSE Examination","screen": const  ResultScreen()},
            ]),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Section title widget
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

  // Grid Section widget
  static Widget gridSection(List<Map<String, dynamic>> items) {
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          childAspectRatio: 0.60,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          Widget iconWidget;
          if (item["image"] != null) {
            iconWidget = Image.asset(
              item["image"],
              height: 30,
              width: 30,
            );
          } else if (item["icon"] != null) {
            iconWidget = Icon(
              item["icon"],
              color: Colors.blue,
            );
          } else {
            iconWidget = const SizedBox();
          }

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
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade200,
                  child: iconWidget,
                ),
                const SizedBox(height: 8),
                Text(
                  item["title"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

/// CUSTOM DRAWER
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, bottom: 20),
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("assets/icons/student.webp"),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edward Thomas",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Class 1 (A)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(),
          drawerItem(context, Icons.home, "Home", () {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }),
          drawerItem(context, Icons.person, "Profile", () {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const StudentProfileScreen()),
            );
          }),
          drawerItem(context, Icons.settings, "Settings", () {
             Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AppSettingsScreen()),
            );
          }),
          drawerItem(context, Icons.info_outline, "About School", () { Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AboutSchoolPage()),
            );}),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget drawerItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}