class Appointment {
  final String title;
  final String date;
  final String time; 

  Appointment({
    required this.title,
    required this.date,
    required this.time,
  });

  // JSON serialization
  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      title: json['title'],
      date: json['date'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'time': time,
    };
  }
}
