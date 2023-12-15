import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../book_appointment_feature/presentation/pages/book_appointment_page.dart';
import '../../../book_appointment_feature/presentation/provider/ScheduleDateTimeProvider.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 332,
        height: 84,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: kColor7, width: 1),
          borderRadius: BorderRadius.circular(5.89),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.calendar_month),
                onPressed: () {
                  ScheduleDateTimeProvider scheduleDateTimeProvider =
                      Provider.of<ScheduleDateTimeProvider>(context,
                          listen: false);
                  scheduleDateTimeProvider.setDate(null);
                  scheduleDateTimeProvider.setTime(null);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return const BookAppointmentPage();
                  }));
                },
                color: kColor6,
              ),
              Flexible(
                child: Consumer<ScheduleDateTimeProvider>(
                  builder: (context, scheduleInfo, child) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          ScheduleDateTimeProvider
                              scheduleDateTimeProvider =
                              Provider.of<ScheduleDateTimeProvider>(context,
                                  listen: false);
                          scheduleDateTimeProvider.setDate(null);
                          scheduleDateTimeProvider.setTime(null);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const BookAppointmentPage();
                          }));
                        },
                        child: Container(
                          width: 255,
                          height: 35,
                          padding: const EdgeInsets.only(left: 14.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: kColor7,
                              )),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ((scheduleInfo.dateTime != null &&
                                    scheduleInfo.time != null)
                                ? ('${formatter1.format(scheduleInfo.dateTime!)} (${scheduleInfo.time!})')
                                : 'Select date'),
                            style: TextStyle(
                                color: (scheduleInfo.dateTime != null
                                    ? kColor1
                                    : kColor9),
                                fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}