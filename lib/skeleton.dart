import 'package:flutter/material.dart';
import 'package:health_pilot/core/constants/constants.dart';

import 'home_page.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor4,
      body: HomePage(),
    );
  }
}
