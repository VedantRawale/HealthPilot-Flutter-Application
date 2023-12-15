import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../business/entities/products.dart';
import '../../business/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  @override
  Future<void> addToCart(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    List<Product> cart = await getCartItems();

    cart.add(product);

    await prefs.setString(
        'cart', jsonEncode(cart.map((e) => e.toJson()).toList()));
  }

  @override
  Future<void> removeFromCart(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    List<Product> cart = await getCartItems();

    cart.removeWhere((element) => element.id == product.id);

    await prefs.setString(
        'cart', jsonEncode(cart.map((e) => e.toJson()).toList()));
  }

  @override
  Future<void> removeAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart');
  }

  @override
  Future<List<Product>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('cart');

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Product> products =
          List<Product>.from(decoded.map((e) => Product.fromJson(e)));
      return products;
    } else {
      return [];
    }
  }
}
