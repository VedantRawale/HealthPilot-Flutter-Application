import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

const kColor1 = Color(0xFF10217D);
const kColor2 = Color(0xFF16C2D5);
const kColor3 = Color(0xFFB0B0B0);
const kColor4 = Colors.white;
const kColor5 = Colors.black;
const kColor6 = Color(0xFF475569);
const kColor7 = Color(0xFFDBDDE0);
const kColor8 = Color(0xFF303030);
const kColor9 = Color(0xFF667085);
const kColor10 = Color(0xFF344054);
const kColor11 = Color(0xFF0F172A);
const kColor12 = Color(0xFF667085);
const rupeecode = '\u20B9';
final kToday = DateTime.now();
final DateFormat formatter1 = DateFormat('dd/MM/yyyy');
final DateFormat formatter2 = DateFormat('dd MMM yyyy');
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
const String hardCopyDescription =
    "Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched.";
const String successText =
    "Lab tests have been scheduled successfully, You will receive a mail of the same. ";
const double reportCost = 150;
CalendarFormat calendarFormat = CalendarFormat.month;
DateTime focusedDay = DateTime.now();
final List<String> times = [
  '8:00 AM',
  '9:00 AM',
  '10:00 AM',
  '11:00 AM',
  '12:00 PM',
  '1:00 PM',
  '2:00 PM',
  '3:00 PM',
  '4:00 PM',
  '5:00 PM',
  '6:00 PM',
  '7:00 PM',
];
