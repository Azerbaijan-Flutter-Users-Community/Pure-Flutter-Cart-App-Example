import 'package:meta/meta.dart';
import './product.dart';

class CartProduct {
  CartProduct({
    @required this.product,
    this.count = 0,
  });

  final Product product;
  int count;

  @override
  String toString() => ''' Product 
  count: $count,
  product: $product,
  ''';
}
