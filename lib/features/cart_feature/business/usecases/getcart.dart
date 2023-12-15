import 'package:flutter/material.dart';
import '../../../../business/entities/products.dart';
import '../repositories/cart_repository.dart';

class GetCart with ChangeNotifier {
  final CartRepository _cartRepository;
  bool addingToCart = false;
  double _mrptotal = 0;
  double _discounttotal = 0;
  int _totalNumberOfItems = 0;
  final Set<String> _st = {};

  GetCart(this._cartRepository) {
    _loadCartData();
  }

  Future<void> _loadCartData() async {
    List<Product> cartItems = await _cartRepository.getCartItems();
    _mrptotal = 0;
    _discounttotal = 0;
    _totalNumberOfItems = 0;
    addingToCart = false;

    _st.clear();

    for (Product product in cartItems) {
      _mrptotal += product.originalprice;
      _discounttotal += (product.originalprice - product.discountprice);
      _totalNumberOfItems++;
      _st.add(product.id);
    }

    notifyListeners();
  }

  Future<List<Product>> getCartItems() async {
    return _cartRepository.getCartItems();
  }

  void addToCart(Product product) {
    _cartRepository.addToCart(product);
    _mrptotal += product.originalprice;
    _discounttotal += (product.originalprice - product.discountprice);
    _totalNumberOfItems++;
    _st.add(product.id);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartRepository.removeFromCart(product);
    _mrptotal -= product.originalprice;
    _discounttotal -= (product.originalprice - product.discountprice);
    _totalNumberOfItems--;
    _st.remove(product.id);
    notifyListeners();
  }

  void removeAll() {
    _cartRepository.removeAll();
    _mrptotal = 0;
    _discounttotal = 0;
    _totalNumberOfItems = 0;
    _st.clear();
  }

  double getMRPTotal() {
    return _mrptotal;
  }

  int getNumberofItems() {
    return _totalNumberOfItems;
  }

  bool isPresentInCart(String id) {
    return _st.contains(id);
  }

  double getDiscountTotal() {
    return _discounttotal;
  }

  void setAddingToCart(bool value) {
    addingToCart = value;
  }
}
