import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';


class ViewDetailsButton extends StatelessWidget {
  const ViewDetailsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0, right: 10, left: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColor4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: kColor1, width: 0.5)),
                fixedSize: const Size(117, 15)),
            onPressed: () {},
            child: const Text(
              'View Details',
              style: TextStyle(
                  color: kColor1, fontSize: 8, fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}