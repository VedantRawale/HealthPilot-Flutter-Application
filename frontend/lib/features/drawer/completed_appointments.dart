import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_pilot/features/book_appointment_feature/presentation/pages/completed_appointment_page.dart';

class CompletedAppointments extends StatelessWidget {
  const CompletedAppointments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(color: Colors.black),
      child: ListTile(
        leading: const Icon(Icons.note_alt, color: Colors.teal),
        title: Text(
          'Completed Appointments',
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const CompletedAppointmentPage()))),
        },
      ),
    );
  }
}
