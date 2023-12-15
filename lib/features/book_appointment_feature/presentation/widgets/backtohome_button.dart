import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../home_page.dart';
import '../provider/ScheduleDateTimeProvider.dart';


class BackToHomeButton extends StatelessWidget {
  const BackToHomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleDateTimeProvider>(
      builder: (context, scheduleDateTime, child) {
        DateTime? selectedDate = scheduleDateTime.getDate();
        String? time = scheduleDateTime.getTime();
        return ElevatedButton(
            onPressed: () {
              scheduleDateTime.resetDateTime();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: kColor1,
                fixedSize: const Size(333, 52)),
            child: const Text(
              'Back to home',
              style: TextStyle(
                  color: kColor4,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ));
      },
    );
  }
}
