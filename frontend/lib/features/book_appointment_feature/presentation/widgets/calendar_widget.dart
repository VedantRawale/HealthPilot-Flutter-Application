import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../core/constants/constants.dart';
import 'package:provider/provider.dart';

import '../provider/ScheduleDateTimeProvider.dart';

class Calendar extends StatefulWidget {
  CalendarFormat calendarFormat;

  Calendar({
    super.key,
    required this.calendarFormat,
  });

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    final dateprovider = Provider.of<ScheduleDateTimeProvider>(context);
    return SizedBox(
        height: 450,
        child: Column(
          children: [
            Flexible(
              child: TableCalendar(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: (dateprovider.getDate() != null
                    ? dateprovider.getDate()!
                    : DateTime.now()),
                calendarFormat: widget.calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(dateprovider.dateTime, day);
                },
                headerStyle: const HeaderStyle(
                    titleCentered: true, formatButtonVisible: false),
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(dateprovider.dateTime, selectedDay)) {
                    dateprovider.setDate(selectedDay);
                  }
                },
                rowHeight: 36,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
