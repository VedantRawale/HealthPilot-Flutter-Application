import 'package:flutter/material.dart';
import '../../../../business/entities/products.dart';


abstract class CartRepository {
  Future<List<Product>> getCartItems();
  void addToCart(Product product);
  void removeFromCart(Product product);
  void removeAll();
}
