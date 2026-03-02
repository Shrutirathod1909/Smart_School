class SchoolEvent {
  final String title;
  final String type;
  final DateTime date;

  SchoolEvent({
    required this.title,
    required this.type,
    required this.date,
  });

  factory SchoolEvent.fromJson(Map<String, dynamic> json) {
    return SchoolEvent(
      title: json['event_title'],
      type: json['event_type'] ?? "schoolEvents ", // if not in DB
      date: DateTime.parse(json['event_date']),
    );
  }
}