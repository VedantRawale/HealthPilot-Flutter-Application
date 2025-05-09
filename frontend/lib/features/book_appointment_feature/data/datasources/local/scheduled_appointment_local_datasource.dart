// lib/features/appointment_feature/data/datasources/local/appointment_local_datasource.dart

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/appointment_model.dart';

class AppointmentLocalDatasource {
  static const _key = 'scheduledAppointments';

  Future<void> saveAppointments(List<Appointment> appointments) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = appointments.map((a) => a.toJson()).toList();
    await prefs.setString(_key, jsonEncode(jsonList));
  }

  Future<List<Appointment>> getAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];
    final List decoded = jsonDecode(jsonString);
    return decoded.map((item) => Appointment.fromJson(item)).toList();
  }
}
