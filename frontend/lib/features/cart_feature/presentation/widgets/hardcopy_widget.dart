import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class HardCopyWidget extends StatefulWidget {
  const HardCopyWidget({super.key});

  @override
  State<HardCopyWidget> createState() => _HardCopyWidgetState();
}

class _HardCopyWidgetState extends State<HardCopyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 332.1,
        height: 120.0,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: kColor7, width: 1),
          borderRadius: BorderRadius.circular(5.89),
        ),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: SelectionOption(),
            ),
            Container(
              width: 270,
              height: 108.54,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                    child: Text(
                      'Hard copy of reports',
                      style: TextStyle(
                          color: kColor6,
                          fontSize: 10.33,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      hardCopyDescription,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: kColor9,
                          fontSize: 10.33,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      '$rupeecode$reportCost per person',
                      style: TextStyle(
                          color: kColor9,
                          fontSize: 10.33,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class SelectionOption extends StatefulWidget {
  const SelectionOption({super.key});

  @override
  _SelectionOptionState createState() => _SelectionOptionState();
}

class _SelectionOptionState extends State<SelectionOption> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        width: 11.77,
        height: 11.77,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? kColor1 : Colors.grey),
          color: isSelected ? kColor1 : Colors.transparent,
        ),
        child: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 11,
              )
            : null,
      ),
    );
  }
}
