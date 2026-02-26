import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event_data.dart';

class SchoolCalendarScreen extends StatefulWidget {
  const SchoolCalendarScreen({super.key});

  @override
  State<SchoolCalendarScreen> createState() =>
      _SchoolCalendarScreenState();
}

class _SchoolCalendarScreenState
    extends State<SchoolCalendarScreen> {

  /// 👉 Current Date Automatically
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  List<SchoolEvent> _getEventsForDay(DateTime day) {
    return schoolEvents.entries
        .where((entry) => isSameDay(entry.key, day))
        .expand((entry) => entry.value)
        .toList();
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
      case "Academic":
        return Colors.green;
      case "National":
        return Colors.deepOrange;
      case "StudentBirthday":
        return Colors.pink;
      case "TeacherBirthday":
        return Colors.teal;
      default:
        return Colors.grey;
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
        elevation: 2,
      ),
      body: Column(
        children: [

          /// ================= CALENDAR CARD =================
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: TableCalendar<SchoolEvent>(

              /// 👉 Dynamic Current Year
              firstDay: DateTime(DateTime.now().year, 1, 1),
              lastDay: DateTime(DateTime.now().year, 12, 31),
              focusedDay: _focusedDay,

              selectedDayPredicate: (day) =>
                  isSameDay(_selectedDay, day),

              eventLoader: _getEventsForDay,

              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle:
                    TextStyle(fontWeight: FontWeight.w600),
                weekendStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
              ),

              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle),
                selectedDecoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle),
                defaultTextStyle:
                    TextStyle(fontWeight: FontWeight.w500),
              ),

              onDaySelected:
                  (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },

              /// 🔴 Colored Dots Under Date
              calendarBuilders: CalendarBuilders(
                markerBuilder:
                    (context, day, events) {
                  if (events.isEmpty)
                    return const SizedBox();

                  return Positioned(
                    bottom: 4,
                    child: Row(
                      mainAxisSize:
                          MainAxisSize.min,
                      children:
                          events.map((event) {
                        final e =
                            event as SchoolEvent;
                        return Container(
                          margin:
                              const EdgeInsets
                                  .symmetric(
                                      horizontal:
                                          1),
                          width: 6,
                          height: 6,
                          decoration:
                              BoxDecoration(
                            color:
                                getEventColor(
                                    e.type),
                            shape:
                                BoxShape.circle,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ),

          /// ================= LEGEND BOX =================
          Container(
            margin:
                const EdgeInsets.symmetric(
                    horizontal: 12),
            padding:
                const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius:
                  BorderRadius.circular(12),
            ),
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                buildLegendDot(
                    Colors.red, "Holiday"),
                buildLegendDot(
                    Colors.orange, "Festival"),
                buildLegendDot(
                    Colors.blue, "Exam"),
                buildLegendDot(
                    Colors.purple, "Vacation"),
                buildLegendDot(
                    Colors.green, "Academic"),
                buildLegendDot(
                    Colors.deepOrange,
                    "National"),
                buildLegendDot(
                    Colors.pink,
                    "Student Birthday"),
                buildLegendDot(
                    Colors.teal,
                    "Teacher Birthday"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// ================= EVENT LIST =================
          Expanded(
            child: events.isEmpty
                ? const Center(
                    child: Text(
                      "No Events",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.w500),
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.all(
                            10),
                    itemCount:
                        events.length,
                    itemBuilder:
                        (context, index) {
                      final event =
                          events[index];
                      return Card(
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      12),
                        ),
                        child: ListTile(
                          leading:
                              CircleAvatar(
                            backgroundColor:
                                getEventColor(
                                    event.type),
                          ),
                          title: Text(
                            event.title,
                            style: const TextStyle(
                                fontWeight:
                                    FontWeight
                                        .w600),
                          ),
                          subtitle:
                              Text(event.type),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  /// 🔵 Legend Dot Widget
  Widget buildLegendDot(
      Color color, String title) {
    return Row(
      mainAxisSize:
          MainAxisSize.min,
      children: [
        CircleAvatar(
            radius: 6,
            backgroundColor: color),
        const SizedBox(width: 4),
        Text(title,
            style:
                const TextStyle(
                    fontSize: 12)),
      ],
    );
  }
}