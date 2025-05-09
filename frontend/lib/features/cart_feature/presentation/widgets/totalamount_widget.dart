import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../business/usecases/getcart.dart';


class TotalAmountWidget extends StatefulWidget {
  const TotalAmountWidget({super.key});

  @override
  State<TotalAmountWidget> createState() => _TotalAmountWidgetState();
}

class _TotalAmountWidgetState extends State<TotalAmountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 332.1,
        height: 169,
        decoration: BoxDecoration(
          border: Border.all(color: kColor7, width: 1),
          borderRadius: BorderRadius.circular(5.89),
        ),
        alignment: Alignment.center,
        child: Container(
          width: 270,
          height: 149,
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'M.R.P Total',
                      style: TextStyle(
                          color: kColor6,
                          fontSize: 10.33,
                          fontWeight: FontWeight.w700),
                    ),
                    Consumer<GetCart>(
                      builder: (context, getCart, child) {
                        double totAmt = getCart.getMRPTotal();
                        return Text('$totAmt',
                            style: const TextStyle(
                                color: kColor6,
                                fontSize: 10.33,
                                fontWeight: FontWeight.w700));
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Discount',
                      style: TextStyle(
                          color: kColor6,
                          fontSize: 10.33,
                          fontWeight: FontWeight.w700),
                    ),
                    Consumer<GetCart>(
                      builder: (context, getCart, child) {
                        double totAmt = getCart.getDiscountTotal();
                        return Text('$totAmt',
                            style: const TextStyle(
                                color: kColor6,
                                fontSize: 10.33,
                                fontWeight: FontWeight.w700));
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Amount to be paid',
                      style: TextStyle(
                          color: kColor1,
                          fontSize: 14.76,
                          fontWeight: FontWeight.w700),
                    ),
                    Consumer<GetCart>(
                      builder: (context, getCart, child) {
                        double totAmt =
                            getCart.getMRPTotal() - getCart.getDiscountTotal();
                        return Text('$rupeecode $totAmt/-',
                            style: const TextStyle(
                                color: kColor1,
                                fontSize: 14.76,
                                fontWeight: FontWeight.w700));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Total savings',
                      style: TextStyle(
                          color: kColor6,
                          fontSize: 11.81,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 20),
                    Consumer<GetCart>(
                      builder: (context, getCart, child) {
                        double totSav = getCart.getDiscountTotal();
                        return Text('$rupeecode $totSav/-',
                            style: const TextStyle(
                                color: kColor1,
                                fontSize: 14.76,
                                fontWeight: FontWeight.w700));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
