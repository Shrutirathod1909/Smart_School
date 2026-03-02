import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:market/screen/event_data.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class SchoolCalendarScreen extends StatefulWidget {
  const SchoolCalendarScreen({super.key});

  @override
  State<SchoolCalendarScreen> createState() =>
      _SchoolCalendarScreenState();
}

class _SchoolCalendarScreenState
    extends State<SchoolCalendarScreen> {

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  Map<DateTime, List<SchoolEvent>> schoolEvents = {};

  /// ✅ API CALL
  Future<void> loadEvents() async {
    final response = await http.get(
      Uri.parse("http://192.168.1.39/orbit/event.php"), // 🔥 change if needed
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      Map<DateTime, List<SchoolEvent>> tempEvents = {};

      for (var item in data['data']) {
        final event = SchoolEvent.fromJson(item);

        final date = DateTime(
          event.date.year,
          event.date.month,
          event.date.day,
        );

        if (tempEvents[date] == null) {
          tempEvents[date] = [];
        }

        tempEvents[date]!.add(event);
      }

      setState(() {
        schoolEvents = tempEvents;
      });
    } else {
      print("API ERROR");
    }
  }

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  List<SchoolEvent> _getEventsForDay(DateTime day) {
    return schoolEvents[
            DateTime(day.year, day.month, day.day)] ??
        [];
  }

  Color getEventColor(String type) {
    switch (type) {
      case "Holiday":
        return Colors.red;
      case "Festival":
        return Colors.orange;
      case "Exam":
        return Colors.blue;
      case "Vacation":
        return Colors.purple;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final events =
        _getEventsForDay(_selectedDay ?? _focusedDay);

    return Scaffold(
      appBar: AppBar(
        title: const Text("School Calendar"),
        centerTitle: true,
      ),
      body: Column(
        children: [

          /// 📅 CALENDAR
          TableCalendar<SchoolEvent>(
            firstDay: DateTime(2020),
            lastDay: DateTime(2030),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) =>
                isSameDay(_selectedDay, day),
            eventLoader: _getEventsForDay,

            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },

            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                if (events.isEmpty) return const SizedBox();

                return Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: events.map((event) {
                    final e = event as SchoolEvent;
                    return Container(
                      margin: const EdgeInsets.all(1),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: getEventColor(e.type),
                        shape: BoxShape.circle,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),

          /// 📋 EVENT LIST
          Expanded(
            child: events.isEmpty
                ? const Center(child: Text("No Events"))
                : ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              getEventColor(event.type),
                        ),
                        title: Text(event.title),
                        subtitle: Text(event.type),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}