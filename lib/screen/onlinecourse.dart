import 'package:flutter/material.dart';

/// 🎨 ORBIT BRAND COLORS
class AppColors {
  static const Color orbitDarkBlue = Color(0xff0D47A1);
  static const Color orbitBlue = Color(0xff1565C0);
  static const Color orbitLightBlue = Color(0xff42A5F5);
  static const Color orbitSky = Color(0xffE3F2FD);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnlineCourseScreen(),
    );
  }
}

class OnlineCourseScreen extends StatelessWidget {
  const OnlineCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orbitSky, // 🌤 Light Sky Background
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.orbitDarkBlue,
                AppColors.orbitBlue,
              ],
            ),
          ),
        ),
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          "Online Course",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Header Text
            const Text(
              "Your Online Course\nis here!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.orbitDarkBlue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Explore and enroll in courses to\nenhance your learning journey",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 22),

            /// Course Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.orbitBlue.withOpacity(0.15),
                    blurRadius: 12,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Banner
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(18)),
                        child: Image.network(
                          "https://i.imgur.com/2yaf2wb.png",
                          height: 190,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(18)),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black87,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 18,
                        left: 18,
                        right: 18,
                        child: Row(
                          children: const [
                            CircleAvatar(
                              radius: 26,
                              backgroundImage: NetworkImage(
                                  "https://i.pravatar.cc/150?img=3"),
                            ),
                            SizedBox(width: 14),
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shivam Verma",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "(9002)",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "Last Updated 26/01/2026",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  /// Content
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "English Course for Beginners",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: AppColors.orbitDarkBlue,
                          ),
                        ),

                        const SizedBox(height: 14),

                        buildIconRow(Icons.menu_book, "Class 1"),
                        const SizedBox(height: 8),
                        buildIconRow(Icons.play_arrow, "Lesson 2"),
                        const SizedBox(height: 8),
                        buildIconRow(Icons.access_time, "02:00:00 Hrs"),

                        const SizedBox(height: 18),

                        /// Price + Rating
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "\$ 72.00",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.orbitBlue,
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(Icons.star,
                                    color: Colors.amber, size: 18),
                                Icon(Icons.star,
                                    color: Colors.amber, size: 18),
                                Icon(Icons.star,
                                    color: Colors.amber, size: 18),
                                Icon(Icons.star_border,
                                    color: Colors.amber, size: 18),
                                Icon(Icons.star_border,
                                    color: Colors.amber, size: 18),
                              ],
                            )
                          ],
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Progress: 0%",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 6),

                        /// Orbit Progress Bar
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: const LinearProgressIndicator(
                            value: 0.0,
                            minHeight: 6,
                            backgroundColor: Color(0xffBBDEFB),
                            color: AppColors.orbitBlue,
                          ),
                        ),

                        const SizedBox(height: 22),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: AppColors.orbitLightBlue,
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Course Details",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.orbitDarkBlue,
                                      AppColors.orbitBlue,
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Start Lesson",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildIconRow(IconData icon, String text) {
    return Row(
      children: const [
        Icon(Icons.circle, size: 0), // dummy (avoid const error)
      ],
    );
  }
}