import 'package:flutter/material.dart';

import '../../../../business/entities/products.dart';
import '../../../../core/constants/constants.dart';



class SubtitleWithIconWidget extends StatelessWidget {
  const SubtitleWithIconWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 140,
        height: 27,
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(product.subtitle1,
                  style: const TextStyle(
                      color: kColor6,
                      fontSize: 11,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                  width: 27,
                  height: 21,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                        'lib/assets/imageassets/badgeicon.png',
                        fit: BoxFit.cover),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
