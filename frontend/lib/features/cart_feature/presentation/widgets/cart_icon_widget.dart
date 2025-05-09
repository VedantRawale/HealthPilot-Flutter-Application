import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../business/usecases/getcart.dart';
import '../pages/mycart_page.dart';

class CartIcon extends StatefulWidget {
  const CartIcon({super.key});

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 60,
      alignment: Alignment.center,
      child: Stack(alignment: Alignment.center, children: [
        IconButton(
          padding: EdgeInsets.only(bottom:1,left:5),
          icon: const Icon(Icons.shopping_cart, color: kColor1, size: 27),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyCartPage();
            }));
          },
        ),
        Positioned(
          left: 0.4,
          top: 4,
          child: Container(
            height: 16,
            width: 16,
            child: Material(
              color: kColor2,
              borderRadius: BorderRadius.circular(25),
              child: Consumer<GetCart>(
                builder: (context, cartUseCase, child) {
                  int numberOfItems = cartUseCase.getNumberofItems();
                  return Center(
                    child: Text(
                      '$numberOfItems',
                      style: const TextStyle(
                          color: kColor1,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
