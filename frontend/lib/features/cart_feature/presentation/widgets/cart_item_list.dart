import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../business/entities/products.dart';
import '../../../../core/constants/constants.dart';
import '../../business/usecases/getcart.dart';
import '../../presentation/widgets/cart_item.dart';



class CartItemList extends StatefulWidget {
  const CartItemList({super.key});

  @override
  State<CartItemList> createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Consumer<GetCart>(
        builder: (context, getCart, child) {
          return FutureBuilder<List<Product>>(
            future: getCart.getCartItems(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error : ${snapshot.error}');
              } else {
                List<Product> productList = snapshot.data!;
                return ListView.builder(
                    itemCount: productList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return CartItemCard(product : productList[index]);
                    }));
              }
            },
          );
        },
      ),
    );
  }
}

