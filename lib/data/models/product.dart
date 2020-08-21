import 'package:meta/meta.dart';

class Product {
  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    this.isAddedToCart = false,
  });

  final String id;
  final String title;
  final double price;
  bool isAddedToCart;

  @override
  String toString() => ''' Product 
  id: $id,
  title: $title,
  price: $price,
  isAddedToCart: $isAddedToCart
  ''';
}
