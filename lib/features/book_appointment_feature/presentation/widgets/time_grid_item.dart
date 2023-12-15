import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../provider/ScheduleDateTimeProvider.dart';


class TimeGridItem extends StatefulWidget {
  final int index;
  const TimeGridItem({required this.index, super.key});

  @override
  State<TimeGridItem> createState() => _TimeGridItemState();
}

class _TimeGridItemState extends State<TimeGridItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleDateTimeProvider>(
      builder: (context, scheduleDateTime, child) {
        String? time = scheduleDateTime.time;
        bool isSelected = (times[widget.index] == time);
        return Container(
          width: 90,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: kColor1, width: 2),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
              backgroundColor: (isSelected ? kColor1 : kColor4),
            ),
            onPressed: () {
              scheduleDateTime.setTime(times[widget.index]);
            },
            child: Center(
                child: Text(
              times[widget.index],
              style: TextStyle(
                  color: (isSelected ? kColor4 : kColor8),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            )),
          ),
        );
      },
    );
  }
}
