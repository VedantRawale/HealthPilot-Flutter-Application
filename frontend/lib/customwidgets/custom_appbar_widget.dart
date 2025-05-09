import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';
import 'package:provider/provider.dart';
import '../features/book_appointment_feature/presentation/provider/ScheduleDateTimeProvider.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool flag;
  CustomAppBar({required this.title, this.flag = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (flag) {
                ScheduleDateTimeProvider scheduleDateTimeProvider =
                    Provider.of(context, listen: false);
                scheduleDateTimeProvider.resetDateTime();
              }
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kColor6,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
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
      ),
    );
  }
}
