import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';


class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.firstThreeLines,
  });

  final List<String> firstThreeLines;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            firstThreeLines.join('\n'),
            style: const TextStyle(
              color: kColor6,
              fontSize: 11,
            ),
          ),
        ));
  }
}
