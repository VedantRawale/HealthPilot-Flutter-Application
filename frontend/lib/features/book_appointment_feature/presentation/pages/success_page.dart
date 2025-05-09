import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/constants.dart';
import '../../../../home_page.dart';
import '../provider/ScheduleDateTimeProvider.dart';
import '../widgets/appointment_datetime_on_successpage.dart';
import '../widgets/backtohome_button.dart';
import '../widgets/successpage_appbar.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SuccessScreen(),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SuccessPageAppBar(),
        const SizedBox(height: 100),
        SuccessPageBody(),
        const SizedBox(height: 130),
        BackToHomeButton(),
      ],
    ));
  }
}

class SuccessPageBody extends StatelessWidget {
  const SuccessPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330,
        height: 417,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: kColor7, width: 1),
          borderRadius: BorderRadius.circular(5.89),
        ),
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/imageassets/successicon.png'),
            const SizedBox(height: 35),
            const Text(
              successText,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kColor11,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 25),
            AppointmentDateTimeOnSuccessPage(),
          ],
        ));
  }
}

