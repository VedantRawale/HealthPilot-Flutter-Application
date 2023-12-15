import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../book_appointment_feature/presentation/pages/success_page.dart';
import '../../../book_appointment_feature/presentation/provider/ScheduleDateTimeProvider.dart';
import '../../business/usecases/getcart.dart';


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
                // We can save all the information regarding order on clicking this button and then proceed
                getCart.removeAll();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const SuccessPage();
                }));
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: (selectedDate != null && time != null)
                    ? kColor1
                    : kColor3,
                fixedSize: const Size(333, 52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text(
              'Schedule',
              style: TextStyle(
                  color: kColor4,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ));
      },
    );
  }
}