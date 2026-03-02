import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings settings =
      InitializationSettings(android: androidSettings);

  await flutterLocalNotificationsPlugin.initialize(settings);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'notice_channel',
    'School Notifications',
    importance: Importance.max,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoticeBoardScreen(),
    );
  }
}

/// ✅ MODEL
class SchoolEvent {
  final String title;
  final DateTime date;

  SchoolEvent({required this.title, required this.date});

  factory SchoolEvent.fromJson(Map<String, dynamic> json) {
    return SchoolEvent(
      title: json['event_title'],
      date: DateTime.parse(json['event_date']),
    );
  }
}

class NoticeBoardScreen extends StatefulWidget {
  const NoticeBoardScreen({super.key});

  @override
  State<NoticeBoardScreen> createState() => _NoticeBoardScreenState();
}

class _NoticeBoardScreenState extends State<NoticeBoardScreen> {

  List<SchoolEvent> events = [];

  @override
  void initState() {
    super.initState();
    loadAndScheduleEvents();
  }

  /// ✅ FETCH FROM API
  Future<void> loadAndScheduleEvents() async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2/event.php"), // 🔥 change if needed
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List temp = data['data'];

      events = temp.map((e) => SchoolEvent.fromJson(e)).toList();

      await scheduleAllEvents();
    } else {
      print("API ERROR");
    }
  }

  /// 🔔 SCHEDULE NOTIFICATIONS
  Future<void> scheduleAllEvents() async {
    DateTime now = DateTime.now();
    int id = 1;

    for (var event in events) {

      DateTime eventDate = DateTime(
        now.year,
        event.date.month,
        event.date.day,
        9,
        0,
      );

      if (eventDate.isBefore(now)) {
        eventDate = DateTime(
          now.year + 1,
          event.date.month,
          event.date.day,
          9,
          0,
        );
      }

      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        event.title,
        "Reminder for this event",
        tz.TZDateTime.from(eventDate, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'notice_channel',
            'School Notifications',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );

      id++;
    }

    print("✅ Notifications Scheduled");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("School Notice Board"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Notifications Scheduled from API ✅",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}