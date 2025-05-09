import 'package:flutter/material.dart';
import 'package:health_pilot/features/cart_feature/business/usecases/getcart.dart';
import 'package:provider/provider.dart';
import '../../../../business/entities/products.dart';
import '../../../../core/constants/constants.dart';


class CartItemCard extends StatefulWidget {
  Product product;
  CartItemCard({required this.product, super.key});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: SizedBox(
          width: 334,
          height: 210,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 334,
                  height: 39,
                  decoration: const BoxDecoration(
                      color: kColor1,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Center(
                      child: Text(
                    widget.product.title,
                    style: const TextStyle(
                        color: kColor4,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ))),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 23.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(widget.product.subtitle1,
                          style: const TextStyle(
                              color: kColor5,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                    Text(
                      '$rupeecode ${widget.product.discountprice}/-',
                      style: const TextStyle(
                          color: kColor2,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
              Align(
                  widthFactor: 12,
                  alignment: Alignment.centerRight,
                  child: Text('${widget.product.originalprice}',
                      style: const TextStyle(
                          color: kColor6,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough))),
              Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      side: const BorderSide(color: kColor1, width: 2.0),
                      backgroundColor: kColor4,
                      fixedSize: const Size(130, 35),
                    ),
                    onPressed: () {
                      GetCart getCart =
                          Provider.of<GetCart>(context, listen: false);
                      getCart.removeFromCart(widget.product);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.delete,
                          size: 15,
                          color: kColor1,
                        ),
                        Text('Remove',
                            style: TextStyle(
                                color: kColor1,
                                fontSize: 13,
                                fontWeight: FontWeight.w500))
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kColor4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      side: const BorderSide(color: kColor1, width: 2.0),
                      fixedSize: const Size(281, 35),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.upload, size: 15, color: kColor1),
                        Text('Upload prescription (optional)',
                            style: TextStyle(
                                color: kColor1,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                        SizedBox(width:10),
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
