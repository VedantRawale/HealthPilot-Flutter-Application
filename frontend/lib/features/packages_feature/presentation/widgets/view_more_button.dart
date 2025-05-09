import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';


class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'View More',
                  style: TextStyle(
                      fontSize: 11,
                      color: kColor6,
                      decoration: TextDecoration.underline),
                ))));
  }
}
