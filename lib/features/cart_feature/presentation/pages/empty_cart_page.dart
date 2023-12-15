import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../home_page.dart';

class EmptyCartPage extends StatelessWidget {
  const EmptyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 680,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height:50),
         SizedBox(
              width: 400,
              height: 400,
              child: Image.asset('lib/assets/imageassets/emptycart.jpg',
                  fit: BoxFit.fill),
            ),
          const SizedBox(height: 100),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColor1,
                  fixedSize: const Size(333, 52),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                'Back to home',
                style: TextStyle(
                    color: kColor4, fontSize: 14, fontWeight: FontWeight.w700),
              )),
        ],
      ),
    );
  }
}
