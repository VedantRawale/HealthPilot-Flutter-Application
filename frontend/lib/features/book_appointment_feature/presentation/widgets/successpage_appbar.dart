import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class SuccessPageAppBar extends StatelessWidget {
  const SuccessPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 30),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Success',
                style: TextStyle(
                  color: kColor8,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: kColor2),
          onPressed: () {},
        ),
      ],
    );
  }
}
