// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../../business/entities/products.dart';
// import '../../../../core/constants/constants.dart';
// import '../../../cart_feature/business/usecases/getcart.dart';

// class AddToCartButton extends StatelessWidget {
//   final Product product;
//   AddToCartButton({
//     super.key,
//     required this.product,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Padding(
//           padding:
//               const EdgeInsets.only(top: 5.0, right: 10, left: 10, bottom: 2.0),
//           child: Consumer<GetCart>(
//             builder: (context, getCart, child) {
//               bool isPresentInCart = getCart.isPresentInCart(product.id);
//               return ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: isPresentInCart ? kColor2 : kColor1,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5)),
//                       fixedSize: const Size(117, 15)),
//                   onPressed: () {
//                     if (!isPresentInCart)
//                       getCart.addToCart(product);
//                     else
//                       getCart.removeFromCart(product);
//                   },
//                   child: Text(
//                     (isPresentInCart ? 'Added to cart' : 'Add to cart'),
//                     style: TextStyle(
//                         color: kColor4,
//                         fontSize: 8,
//                         fontWeight: FontWeight.w700),
//                   ));
//             },
//           )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../business/entities/products.dart';
import '../../../../core/constants/constants.dart';
import '../../../cart_feature/business/usecases/getcart.dart';

class AddToCartButton extends StatefulWidget {
  final Product product;

  const AddToCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 5.0, right: 10, left: 10, bottom: 2.0),
        child: Consumer<GetCart>(
          builder: (context, getCart, child) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: getCart.addingToCart
                    ? kColor3
                    : getCart.isPresentInCart(widget.product.id)
                        ? kColor2
                        : kColor1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(117, 15),
              ),
              onPressed: () async {
                if (!getCart.isPresentInCart(widget.product.id)) {
                  getCart.setAddingToCart(true);
                  setState(() {});
                  await Future.delayed(const Duration(milliseconds: 600));
                  getCart.addToCart(widget.product);
                  getCart.setAddingToCart(false);
                  setState(() {});
                } else {
                  getCart.removeFromCart(widget.product);
                }
              },
              child: Text(
                getCart.addingToCart
                    ? 'Adding to cart...'
                    : getCart.isPresentInCart(widget.product.id)
                        ? 'Added to cart'
                        : 'Add to cart',
                style: const TextStyle(
                  color: kColor4,
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
