import 'package:flutter/material.dart';
import '../core/constants/constants.dart';


class TitleWithButtonWidget extends StatelessWidget {
  final String title;
  const TitleWithButtonWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                  color: kColor1, fontSize: 23, fontWeight: FontWeight.w500),
            ),
          ),
          Flexible(child: SizedBox(width: 120)),
          const Text('View more',
              style: TextStyle(
                  color: kColor1,
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(Icons.arrow_forward, color: kColor1, size: 20),
          )
        ]);
  }
}
