import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleDateTimeProvider with ChangeNotifier {
  DateTime? _dateTime;
  String? _time;

  DateTime? get dateTime => _dateTime;
  String? get time => _time;

  ScheduleDateTimeProvider() {
    _dateTime = null;
    _time = null;
  }

  void setDate(DateTime? dateTime) {
    _dateTime = dateTime;
    notifyListeners();
  }

  void setTime(String? time) {
    _time = time;
    notifyListeners();
  }

  DateTime? getDate() {
    return _dateTime;
  }

  String? getTime() {
    return time;
  }

  void resetDateTime() {
    _dateTime = null;
    _time = null;
    notifyListeners();
  }
}
