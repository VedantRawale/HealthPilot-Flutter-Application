import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_pilot/features/patient_reports_feature/presentation/pages/view_report.dart';

class PatientReports extends StatelessWidget {
  const PatientReports({
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
          'Patient Reports',
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => PDFViewerScreen()))),
        },
      ),
    );
  }
}