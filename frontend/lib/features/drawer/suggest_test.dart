import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_pilot/features/book_appointment_feature/presentation/pages/scheduled_appointment_page.dart';
import 'package:health_pilot/features/suggest_labtest_feature/presentation/pages/suggest_test_page.dart';

class SuggestTest extends StatelessWidget {
  const SuggestTest({
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
          'Suggest Test',
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const SuggestTestPage()))),
        },
      ),
    );
  }
}