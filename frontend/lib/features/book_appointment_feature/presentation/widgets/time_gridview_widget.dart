import 'package:flutter/material.dart';
import 'package:health_pilot/features/book_appointment_feature/presentation/widgets/time_grid_item.dart';

class TimeGridWidget extends StatelessWidget {
  const TimeGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 345,
        height: 200,
        padding: const EdgeInsets.all(4.0),
        alignment: Alignment.center,
        child: GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 90 / 36,
          ),
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return TimeGridItem(index: index);
          },
        ));
  }
}
