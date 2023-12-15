import 'package:flutter/material.dart';
import 'package:health_pilot/features/book_appointment_feature/presentation/widgets/calendar_widget.dart';
import 'package:health_pilot/features/book_appointment_feature/presentation/widgets/confirm_button_widget.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../customwidgets/custom_appbar_widget.dart';
import '../provider/ScheduleDateTimeProvider.dart';
import '../widgets/time_gridview_widget.dart';


class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({super.key});

  @override
  State<BookAppointmentPage> createState() => _BookAppointMentPageState();
}

class _BookAppointMentPageState extends State<BookAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    ScheduleDateTimeProvider scheduleDateTimeProvider =
        Provider.of<ScheduleDateTimeProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomAppBar(title: 'Book Appointment',flag:true),
          const SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.center,
              width: 350,
              height: 620,
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Date',
                    style: TextStyle(
                        color: kColor8,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                      width: 330,
                      height: 335,
                      alignment: Alignment.center,
                      child: Card(
                        elevation: 1,
                        child: Calendar(
                            calendarFormat: calendarFormat,
                            ),
                      )),
                  const SizedBox(height: 29),
                  const Text(
                    'Select Time',
                    style: TextStyle(
                        color: kColor8,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  TimeGridWidget(),
                ],
              )),
          const SizedBox(height: 5),
          const ConfirmButton(),
        ],
      )),
    );
  }
}

