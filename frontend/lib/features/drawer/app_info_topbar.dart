import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_pilot/features/authentication_feature/data/datasources/local/auth_local_datasource.dart';

class AppInfo extends StatelessWidget {
  final String userName;
  const AppInfo({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        color: Colors.white,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const CircleAvatar(
            //   radius: 60,
            //   backgroundImage: AssetImage("android/assets/images/app_logo.png"),
            // ),
            Flexible(
              child: SizedBox(
                height: 100,
                width: 200,
                child: Image.asset('lib/assets/imageassets/applogo.png',
                    fit: BoxFit.contain),
              ),
            ),
            // const SizedBox(height: ),
            Text(
              userName,
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Stay Fit, Stay Healthy !',
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ));
  }
}
