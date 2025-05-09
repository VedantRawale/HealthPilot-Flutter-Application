import 'package:flutter/material.dart';
import 'package:health_pilot/features/book_appointment_feature/data/datasources/local/scheduled_appointment_local_datasource.dart';
import 'package:health_pilot/features/book_appointment_feature/data/models/appointment_model.dart';

class ScheduledAppointmentPage extends StatefulWidget {
  const ScheduledAppointmentPage({super.key});

  @override
  State<ScheduledAppointmentPage> createState() => _ScheduledAppointmentPageState();
}

class _ScheduledAppointmentPageState extends State<ScheduledAppointmentPage> {
  List<Appointment> _appointments = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  Future<void> _loadAppointments() async {
    final localDataSource = AppointmentLocalDatasource();
    final appointments = await localDataSource.getAppointments();
    setState(() {
      _appointments = appointments;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = const Color(0xFF0A2A66); // deep navy blue like your sidebar
    final accentColor = const Color(0xFF00C6AD); // matching the greenish-blue from "Add to Cart"

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scheduled Appointments'),
        backgroundColor: themeColor,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _appointments.isEmpty
              ? const Center(child: Text("No scheduled appointments."))
              : ListView.builder(
                  itemCount: _appointments.length,
                  itemBuilder: (context, index) {
                    final appointment = _appointments[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: ListTile(
                          leading: Icon(Icons.calendar_today, color: accentColor),
                          title: Text(
                            appointment.title,
                            style: TextStyle(fontWeight: FontWeight.bold, color: themeColor),
                          ),
                          subtitle: Text(
                            "Date: ${appointment.date.split('T')[0]}\nTime: ${appointment.time}",
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
