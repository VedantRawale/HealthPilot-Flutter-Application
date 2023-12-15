import 'package:flutter/material.dart';

import '../../../../business/entities/products.dart';
import '../../../../core/constants/constants.dart';


class SubtitleWithPricesWidget extends StatelessWidget {
  final Product product;
  SubtitleWithPricesWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 30,
        width: 140,
        alignment: Alignment.centerLeft,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: Text(product.subtitle2,
                    style: const TextStyle(
                        color: kColor6,
                        fontSize: 9,
                        fontWeight: FontWeight.w400)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 9),
                  Text(
                    '$rupeecode ${product.discountprice}',
                    style: const TextStyle(
                        color: kColor1,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    product.originalprice.toString(),
                    style: const TextStyle(
                        color: kColor6,
                        fontSize: 6.5,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ]),
      ),
    );
  }
}