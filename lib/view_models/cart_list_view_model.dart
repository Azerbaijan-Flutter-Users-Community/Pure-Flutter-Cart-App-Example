import 'package:flutter/material.dart';
import '../data/models/cart_product.dart';
import '../data/models/product.dart';

class CartListValueNotifier extends ValueNotifier<List<CartProduct>> {
  CartListValueNotifier(this._value) : super(_value);

  final List<CartProduct> _value;

  @override
  List<CartProduct> get value => _value;

  @override
  set value(List<CartProduct> newValue) {
    super.value = newValue;
  }

  void addProductToCart(CartProduct cartProduct) {
    cartProduct.product.isAddedToCart = true;
    cartProduct.count = 1;
    notifyListeners();
  }

  void incrementCount(CartProduct cartProduct) {
    cartProduct.count++;
    notifyListeners();
  }

  void decrementCount(CartProduct cartProduct) {
    if (cartProduct.count > 1) {
      cartProduct.count--;
    } else {
      cartProduct.product.isAddedToCart = false;
      cartProduct.count = 0;
    }
    notifyListeners();
  }

  bool deleteProduct(CartProduct cartProduct) {
    final res = value.remove(cartProduct);
    if (res) notifyListeners();
    return res;
  }
}

class CartListViewModel {
  /// cart count notifier
  final cartCountNotifier = ValueNotifier<int>(0);

  /// default values
  final cartProductsNotifier = CartListValueNotifier(<CartProduct>[
    CartProduct(product: Product(id: '0', price: .50, title: 'Corek 0')),
    CartProduct(product: Product(id: '1', price: .60, title: 'Corek 1')),
    CartProduct(product: Product(id: '3', price: .80, title: 'Corek 3')),
    CartProduct(product: Product(id: '4', price: .90, title: 'Corek 4')),
  ]);

  void addToCart(CartProduct cartProduct) {
    cartProductsNotifier.addProductToCart(cartProduct);
    cartCountNotifier.value++;
  }

  void incrementCount(CartProduct cartProduct) {
    cartProductsNotifier.incrementCount(cartProduct);
    cartCountNotifier.value++;
  }

  void decrementCount(CartProduct cartProduct) {
    cartProductsNotifier.decrementCount(cartProduct);
    cartCountNotifier.value--;
  }

  bool deleteProduct(CartProduct cartProduct) {
    final count = cartProduct.count;
    final res = cartProductsNotifier.deleteProduct(cartProduct);
    cartCountNotifier.value -= count;
    return res;
  }
}
