import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class Lecture {
  String name;
  TimeOfDay start;
  TimeOfDay end;

  Lecture({required this.name, required this.start, required this.end});
}

class LectureAttendance {
  Lecture lecture;
  String status; // Present / Absent / Late

  LectureAttendance({required this.lecture, this.status = "Absent"});
}

class AttendanceScreen extends StatefulWidget {
  final String userId;
  final String role;

  const AttendanceScreen({
    super.key,
    required this.userId,
    required this.role,
  });

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool isLoading = true;
  bool isCheckedIn = false;
  bool isCheckedOut = false;

  Map<int, String> attendanceMap = {};
  int present = 0, absent = 0, late = 0;
  double percent = 0;

  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  // SCHOOL COORDINATES
  double schoolLat = 19.11333;
  double schoolLng = 73.016667;

  double? currentLat;
  double? currentLng;
  double? distanceFromSchool;

  List<Lecture> lectures = [
    Lecture(name: "Maths", start: const TimeOfDay(hour: 12, minute: 0), end: const TimeOfDay(hour: 12, minute: 45)),
    Lecture(name: "Science", start: const TimeOfDay(hour: 13, minute: 0), end: const TimeOfDay(hour: 13, minute: 45)),
    Lecture(name: "English", start: const TimeOfDay(hour: 14, minute: 0), end: const TimeOfDay(hour: 14, minute: 45)),
    Lecture(name: "History", start: const TimeOfDay(hour: 15, minute: 0), end: const TimeOfDay(hour: 15, minute: 45)),
    Lecture(name: "Geography", start: const TimeOfDay(hour: 16, minute: 0), end: const TimeOfDay(hour: 16, minute: 45)),
    Lecture(name: "Sports", start: const TimeOfDay(hour: 17, minute: 0), end: const TimeOfDay(hour: 17, minute: 45)),
  ];

  List<LectureAttendance> lectureAttendance = [];

  final List<String> months = [
    "Jan","Feb","Mar","Apr","May","Jun",
    "Jul","Aug","Sep","Oct","Nov","Dec"
  ];

  @override
  void initState() {
    super.initState();
    if (widget.role == "Admin") {
      fetchAllAttendance();
    } else {
      fetchAttendance();
      updateLocation();
    }
  }

  /// ================= LOCATION =================
  Future<Position> getLocation() async {
    bool enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) throw "Location OFF";

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) throw "Permission Denied";
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> updateLocation() async {
    try {
      Position pos = await getLocation();
      setState(() {
        currentLat = pos.latitude;
        currentLng = pos.longitude;
        distanceFromSchool = Geolocator.distanceBetween(
            currentLat!, currentLng!, schoolLat, schoolLng);
      });
    } catch (e) {
      debugPrint("Location Error: $e");
    }
  }

  /// ================= FETCH ATTENDANCE =================
  Future<void> fetchAttendance() async {
    setState(() => isLoading = true);

    try {
      final url =
          "http://192.168.1.39/orbit/attendance.php?type=${widget.role}&id=${widget.userId}&month=$selectedMonth&year=$selectedYear";

      final res = await http.get(Uri.parse(url));
      final data = jsonDecode(res.body);

      attendanceMap.clear();
      present = 0; absent = 0; late = 0;
      isCheckedIn = false;
      isCheckedOut = false;

      DateTime now = DateTime.now();

      if (data['status'] == 'success') {
        for (var item in data['data']) {
          DateTime dt = DateTime.parse(item['attendance_date']);
          int day = dt.day;

          attendanceMap[day] = item['status'] ?? "Absent";

          if (item['status'] == "Present") present++;
          if (item['status'] == "Absent") absent++;
          if (item['status'] == "Late") late++;

          if (dt.year == now.year &&
              dt.month == now.month &&
              dt.day == now.day) {
            if (item['check_in_time'] != null) isCheckedIn = true;
            if (item['check_out_time'] != null) isCheckedOut = true;
          }
        }
      }

      int total = present + absent + late;
      percent = total == 0 ? 0 : (present / total) * 100;

      lectureAttendance = calculateLectureAttendance(now);
    } catch (e) {
      debugPrint("Fetch Error: $e");
    }

    setState(() => isLoading = false);
  }

  /// ================= LECTURE ATTENDANCE =================
  List<LectureAttendance> calculateLectureAttendance(DateTime now) {
    List<LectureAttendance> result = [];
    for (var lecture in lectures) {
      DateTime lectureStart = DateTime(now.year, now.month, now.day, lecture.start.hour, lecture.start.minute);
      DateTime lectureEnd = DateTime(now.year, now.month, now.day, lecture.end.hour, lecture.end.minute);

      String status = "Absent";

      if (isCheckedIn) {
        Duration diff = now.difference(lectureStart);
        if (diff.inMinutes < 0) {
          status = "Present"; // Before lecture starts
        } else if (diff.inMinutes <= 15) {
          status = "Late"; // Within 15 min
        } else {
          status = "Absent"; // After 15 min
        }
      }

      result.add(LectureAttendance(lecture: lecture, status: status));
    }
    return result;
  }

  /// ================= CHECK-IN =================
  Future<void> checkIn() async {
    try {
      final pos = await getLocation();
      double distance = Geolocator.distanceBetween(
          pos.latitude, pos.longitude, schoolLat, schoolLng);

      if (distance > 100) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("You are outside school")));
        return;
      }

      final res = await http.post(
        Uri.parse("http://192.168.1.39/orbit/attendance.php"),
        body: {
          "action": "checkin",
          "type": widget.role,
          "id": widget.userId,
        },
      );

      final data = jsonDecode(res.body);

      if (data['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Checked in successfully")));
        await fetchAttendance();
        await updateLocation();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? "Check-in failed")));
      }
    } catch (e) {
      debugPrint("Check-in Error: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Location error")));
    }
  }

  /// ================= CHECK-OUT =================
  Future<void> checkOut() async {
    try {
      final res = await http.post(
        Uri.parse("http://192.168.1.39/orbit/attendance.php"),
        body: {
          "action": "checkout",
          "type": widget.role,
          "id": widget.userId,
        },
      );

      final data = jsonDecode(res.body);

      if (data['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Checked out successfully")));
        await fetchAttendance();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? "Checkout failed")));
      }
    } catch (e) {
      debugPrint("Check-out Error: $e");
    }
  }

  /// ================= COLOR MAP =================
  Color getColor(String? status) {
    switch (status) {
      case "Present":
        return Colors.green;
      case "Absent":
        return Colors.red;
      case "Late":
        return Colors.orange;
      default:
        return Colors.grey.shade300;
    }
  }

  int getDays(int m, int y) => DateTime(y, m + 1, 0).day;

  /// ================= UI =================
  @override
  Widget build(BuildContext context) {
    int days = getDays(selectedMonth, selectedYear);

    return Scaffold(
      appBar: AppBar(title: Text("${widget.role} Attendance")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await fetchAttendance();
                await updateLocation();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    // Location
                    if (currentLat != null && currentLng != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "📍 Lat: ${currentLat!.toStringAsFixed(5)}, Lng: ${currentLng!.toStringAsFixed(5)}\nDistance: ${distanceFromSchool?.toStringAsFixed(2)} m",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    // Summary
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.purple]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Text("Attendance %",
                              style: TextStyle(color: Colors.white)),
                          Text("${percent.toStringAsFixed(1)}%",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _box("Present", present, Colors.green),
                              _box("Absent", absent, Colors.red),
                              _box("Late", late, Colors.orange),
                            ],
                          )
                        ],
                      ),
                    ),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: isCheckedIn ? null : checkIn,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const Text("Check-In"),
                        ),
                        ElevatedButton(
                          onPressed:
                              isCheckedIn && !isCheckedOut ? checkOut : null,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Text("Check-Out"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Calendar
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: days,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7),
                      itemBuilder: (_, i) {
                        int day = i + 1;
                        return Column(
                          children: [
                            Text("$day"),
                            const SizedBox(height: 4),
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: getColor(attendanceMap[day]),
                                shape: BoxShape.circle,
                              ),
                            )
                          ],
                        );
                      },
                    ),

                    // Lecture-wise
                    const SizedBox(height: 20),
                    const Text("Lecture-wise Attendance",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lectureAttendance.length,
                      itemBuilder: (context, index) {
                        var att = lectureAttendance[index];
                        return ListTile(
                          title: Text(att.lecture.name),
                          subtitle: Text(
                              "${att.lecture.start.format(context)} - ${att.lecture.end.format(context)}"),
                          trailing: CircleAvatar(
                            backgroundColor: getColor(att.status),
                            child: Text(att.status[0]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _box(String title, int value, Color color) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 4),
        CircleAvatar(
          backgroundColor: color,
          child: Text("$value"),
        )
      ],
    );
  }

  /// ================= ADMIN =================
  List<Map<String, dynamic>> allUsers = [];
  String selectedRoleFilter = "All";

  Future<void> fetchAllAttendance() async {
    final url =
        "http://192.168.1.39/orbit/admin.php?action=all_month&month=$selectedMonth&year=$selectedYear";

    final res = await http.get(Uri.parse(url));
    final data = jsonDecode(res.body);

    if (data['status'] == 'success') {
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(data['data']);

      if (selectedRoleFilter != "All") {
        list = list
            .where((e) => e['role'] == selectedRoleFilter.toLowerCase())
            .toList();
      }

      setState(() {
        allUsers = list;
      });
    }
  }

  Future<void> markAttendance(String id, String role, String status) async {
    final res = await http.post(
      Uri.parse("http://192.168.1.39/orbit/admin.php"),
      body: {
        "action": "admin_mark",
        "type": role,
        "id": id,
        "status": status,
        "date": DateTime.now().toString().split(" ")[0],
      },
    );

    final data = jsonDecode(res.body);

    if (data['status'] == 'success') {
      fetchAllAttendance();
    }
  }
}