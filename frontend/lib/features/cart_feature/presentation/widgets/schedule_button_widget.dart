import 'package:flutter/material.dart';
import 'package:health_pilot/business/services/notification_service.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../book_appointment_feature/presentation/pages/success_page.dart';
import '../../../book_appointment_feature/presentation/provider/ScheduleDateTimeProvider.dart';
import '../../business/usecases/getcart.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../book_appointment_feature/data/models/appointment_model.dart';
import '../../../book_appointment_feature/data/datasources/local/scheduled_appointment_local_datasource.dart';
import '../../../authentication_feature/data/datasources/local/auth_local_datasource.dart';

Future<bool> bookAppointment(
    String userId, String date, String time, String testId) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/api/book'),
      headers: {'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await AuthLocalDataSource().getAccessToken()}'}, // Add the access token here
      body: jsonEncode({
        'user_id': userId,
        'date': date,
        'time': time,
        'test_id': testId,
      }),
    );

    return response.statusCode == 200;
  } catch (e) {
    debugPrint("Booking error: $e");
    return false;
  }
}

class ScheduleButton extends StatelessWidget {
  const ScheduleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleDateTimeProvider>(
      builder: (context, scheduleDateTime, child) {
        DateTime? selectedDate = scheduleDateTime.getDate();
        String? time = scheduleDateTime.getTime();
        GetCart getCart = Provider.of<GetCart>(context);
        return ElevatedButton(
            onPressed: () async {
              if (selectedDate != null && time != null) {
                final userId = await AuthLocalDataSource().getUserId();
                final cartItems = await getCart.getCartItems();

                if (cartItems.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Cart is empty!")));
                  return;
                }

                final testId = cartItems.map((e) => e.id).join('---');
                print("userid: $userId, testId: $testId");
                String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                print("Selected date: $selectedDate, time: $time");
                final response =
                    await bookAppointment(userId, formattedDate, time, testId);

                if (response) {
                  final appointments = cartItems.map((cartItem) {
                    return Appointment(
                      title: cartItem.id,
                      date: selectedDate.toIso8601String(),
                      time: time,
                    );
                  }).toList();

                  await AppointmentLocalDatasource()
                      .saveAppointments(appointments);

                  Provider.of<ScheduleDateTimeProvider>(context, listen: false)
                      .resetDateTime();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Booking failed. Try again.")));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please select a date and time.")));
              }

              getCart.removeAll();
              NotificationService().showNotification(
                  title: 'Appointment Scheduled Successfully!',
                  body: 'Date of Appointment : $selectedDate at $time');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SuccessPage();
              }));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    (selectedDate != null && time != null) ? kColor1 : kColor3,
                fixedSize: const Size(333, 52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text(
              'Schedule',
              style: TextStyle(
                  color: kColor4, fontSize: 14, fontWeight: FontWeight.w700),
            ));
      },
    );
  }
}
