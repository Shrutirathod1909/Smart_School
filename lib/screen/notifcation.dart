import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'event_data.dart';

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

  // Request notification permission for Android 13+
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  // Create Notification Channel
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

class NoticeBoardScreen extends StatefulWidget {
  const NoticeBoardScreen({super.key});

  @override
  State<NoticeBoardScreen> createState() => _NoticeBoardScreenState();
}

class _NoticeBoardScreenState extends State<NoticeBoardScreen> {
  @override
  void initState() {
    super.initState();
    scheduleAllEvents();
  }

  /// 🔔 Schedule All School Events Notifications
  Future<void> scheduleAllEvents() async {
    DateTime now = DateTime.now();
    int id = 1; // unique ID for each notification

    for (var entry in schoolEvents.entries) {
      for (var event in entry.value) {
        // Schedule for 9 AM on the event day
        DateTime eventDate = DateTime(
          now.year,
          event.date.month,
          event.date.day,
          9,
          0,
        );

        // If the date already passed, schedule for next year
        if (eventDate.isBefore(now)) {
          eventDate = DateTime(
            now.year + 1,
            event.date.month,
            event.date.day,
            9,
            0,
          );
        }

        // Schedule notification
        await flutterLocalNotificationsPlugin.zonedSchedule(
          id,
          event.title, // Event title
          "Reminder for this notice", // Notification body
          tz.TZDateTime.from(eventDate, tz.local),
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'notice_channel',
              'Notice Reminder',
              importance: Importance.max,
              priority: Priority.high,
              playSound: true,
            ),
          ),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        );

        id++; // increment ID for next notification
      }
    }
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
          "All Events Notifications Scheduled ✅",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}