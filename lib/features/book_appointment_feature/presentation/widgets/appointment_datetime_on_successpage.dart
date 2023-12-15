import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../provider/ScheduleDateTimeProvider.dart';


class AppointmentDateTimeOnSuccessPage extends StatelessWidget {
  const AppointmentDateTimeOnSuccessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleDateTimeProvider>(
      builder: (context, scheduleDateTime, child) {
        DateTime? date = scheduleDateTime.getDate();
        String? time = scheduleDateTime.getTime();
        String fdate = formatter2.format(date ?? DateTime.now());
        return Text(
          '$fdate | $time',
          style: const TextStyle(
              color: kColor12,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        );
      },
    );
  }
}
