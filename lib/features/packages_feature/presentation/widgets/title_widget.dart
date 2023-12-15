import 'package:flutter/material.dart';

import '../../../../business/entities/products.dart';
import '../../../../core/constants/constants.dart';


class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            product.title,
            style: const TextStyle(color: kColor5, fontSize: 18),
          ),
        ));
  }
}
