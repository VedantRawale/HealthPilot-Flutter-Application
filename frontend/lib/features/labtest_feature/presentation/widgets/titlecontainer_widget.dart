import 'package:flutter/material.dart';

import '../../../../business/entities/products.dart';
import '../../../../core/constants/constants.dart';


class TitleContainerWidget extends StatelessWidget {
  const TitleContainerWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 30,
        decoration: BoxDecoration(
            color: kColor1.withOpacity(0.8),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        child: Center(
          child: Text(
            product.title,
            style: const TextStyle(
                color: kColor4,
                fontSize: 13,
                fontWeight: FontWeight.w700),
          ),
        ));
  }
}