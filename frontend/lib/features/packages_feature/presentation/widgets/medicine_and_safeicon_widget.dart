import 'package:flutter/material.dart';

class MedicineAndSafeIconWidget extends StatelessWidget {
  const MedicineAndSafeIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        SizedBox(
          height: 60,
          width: 60,
          child: Image.asset(
              'lib/assets/imageassets/medicineicon.png',
              fit: BoxFit.contain),
        ),
        const SizedBox(width: 110),
        SizedBox(
          width: 55,
          height: 20,
          child: Image.asset(
              'lib/assets/imageassets/safeicon.png',
              fit: BoxFit.contain),
        )
      ],
    );
  }
}
