import 'package:flutter/material.dart';
import 'package:health_pilot/core/constants/constants.dart';
import 'package:health_pilot/features/authentication_feature/data/datasources/local/auth_local_datasource.dart';
import 'package:health_pilot/features/book_appointment_feature/presentation/pages/completed_appointment_page.dart';
import 'package:health_pilot/features/book_appointment_feature/presentation/pages/scheduled_appointment_page.dart';
import 'package:health_pilot/features/drawer/app_info_topbar.dart';
import 'package:health_pilot/features/drawer/completed_appointments.dart';
import 'package:health_pilot/features/drawer/scheduled_appointments.dart';
import 'package:health_pilot/features/drawer/suggest_test.dart';
import 'package:health_pilot/features/drawer/patient_report.dart';

class OpenDrawer extends StatelessWidget {
  const OpenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder<String>(
              future: AuthLocalDataSource().getUserName(), // your async call
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // or a loading widget
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return AppInfo(
                    userName: snapshot.data ?? 'Unknown',
                  );
                }
              },
            ),

            // SizedBox(height: 200),
            Container(
              height: 800,
              color: kColor1,
              padding: const EdgeInsets.all(24),
              child: Wrap(
                children: const [
                  ScheduledAppointments(),
                  Divider(
                    color: Colors.black54,
                    thickness: 1,
                  ),
                  CompletedAppointments(),
                  Divider(
                    color: Colors.black54,
                    thickness: 1,
                  ),
                  SuggestTest(),
                  Divider(
                    color: Colors.black54,
                    thickness: 1,
                  ),
                  PatientReports(),
                  Divider(
                    color: Colors.black54,
                    thickness: 1,
                  ),
                  // Bills(),
                  Divider(
                    color: Colors.black54,
                    thickness: 1,
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //       height: 50,
            //       color: Colors.white,
            //       alignment: Alignment.center,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             "Made With ",
            //             style: GoogleFonts.architectsDaughter(
            //                 color: Colors.black, fontSize: 20),
            //           ),
            //           const LoveIcon(),
            //         ],
            //       )),
            // )
          ],
        )),
      );
}
