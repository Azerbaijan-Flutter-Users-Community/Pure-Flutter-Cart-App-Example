import 'package:flutter/material.dart';
import '../../providers/view_model_provider.dart';
import '../../view_models/cart_list_view_model.dart';
import '../../data/models/cart_product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key key,
    @required this.cartProduct,
  }) : super(key: key);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    final currentProduct = cartProduct.product;
    final cartListViewModel =
        ViewModelProvider.of<CartListViewModel>(context).viewModel;

    return Dismissible(
      key: ValueKey(currentProduct.id),
      confirmDismiss: (direction) async {
        return cartListViewModel.deleteProduct(cartProduct);
      },
      background: Container(
        color: Colors.red,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('onDismissed');
      },
      onResize: () {
        print('onResize');
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Text(currentProduct.id),
            ),
          ),
          title: Text(currentProduct.title),
          subtitle: Text('${currentProduct.price.toStringAsFixed(2)} AZN'),
          trailing: currentProduct.isAddedToCart
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () =>
                          cartListViewModel.decrementCount(cartProduct),
                    ),
                    Text('${cartProduct.count}'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () =>
                          cartListViewModel.incrementCount(cartProduct),
                    ),
                  ],
                )
              : IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () => cartListViewModel.addToCart(cartProduct),
                ),
        ),
      ),
    );
  }
}
