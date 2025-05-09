import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../provider/ScheduleDateTimeProvider.dart';
import 'package:intl/intl.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleDateTimeProvider>(
      builder: (context, scheduleDateTime, child) {
        DateTime? selectedDate = scheduleDateTime.getDate();
        String? time = scheduleDateTime.getTime();
        return ElevatedButton(
            onPressed: () async {
              if (selectedDate != null && time != null) {
                scheduleDateTime.setDate(selectedDate);
                scheduleDateTime.setTime(time);
                print("Selected date: $selectedDate, time: $time");
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please select a date and time"),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    (selectedDate != null && time != null) ? kColor1 : kColor3,
                fixedSize: const Size(333, 52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              ((selectedDate == null && time == null) ? 'Next' : 'Confirm'),
              style: const TextStyle(
                  color: kColor4, fontSize: 14, fontWeight: FontWeight.w700),
            ));
      },
    );
  }
}
