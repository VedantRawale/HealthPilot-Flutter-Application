import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../business/entities/products.dart';
import '../../../../core/constants/constants.dart';
import '../../../cart_feature/business/usecases/getcart.dart';


class PackageItemAddToCartButton extends StatefulWidget {
  final Product product;
  const PackageItemAddToCartButton({
    required this.product,
    super.key,
  });

  @override
  State<PackageItemAddToCartButton> createState() => _PackageItemAddToCartButtonState();
}

class _PackageItemAddToCartButtonState extends State<PackageItemAddToCartButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GetCart>(
      builder: (context, getCart, child) {
        bool isPresentInCart = getCart.isPresentInCart(widget.product.id);
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: getCart.addingToCart ? kColor3 : isPresentInCart ? kColor2: kColor4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                        color: getCart.addingToCart ? kColor3 : isPresentInCart ? kColor2: kColor1,
                        width: 0.75)),
                fixedSize: const Size(115, 30)),
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
              (getCart.addingToCart ? 'Adding to cart' : isPresentInCart? 'Added to cart' : 'Add to Cart'),
              style: TextStyle(
                  color: getCart.addingToCart? kColor4: isPresentInCart ? kColor4 : kColor1,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ));
      },
    );
  }
}
