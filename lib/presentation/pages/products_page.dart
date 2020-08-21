import 'package:flutter/material.dart';
import '../../providers/view_model_provider.dart';
import '../../view_models/cart_list_view_model.dart';
import '../widgets/product_item.dart';
import '../../data/models/cart_product.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartListViewModel =
        ViewModelProvider.of<CartListViewModel>(context).viewModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              fit: StackFit.expand,
              overflow: Overflow.visible,
              children: [
                Icon(Icons.shopping_cart),
                ValueListenableBuilder<int>(
                  valueListenable: cartListViewModel.cartCountNotifier,
                  builder: (_, cartValue, __) {
                    return Visibility(
                      visible: cartValue != 0,
                      child: Positioned(
                        right: -(kToolbarHeight * 0.08),
                        child: Material(
                          color: Colors.pink,
                          type: MaterialType.circle,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '$cartValue',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder<List<CartProduct>>(
        valueListenable: cartListViewModel.cartProductsNotifier,
        builder: (context, products, _) => ListView.builder(
          itemBuilder: (context, i) => ProductItem(
            cartProduct: products[i],
          ),
          itemCount: products.length,
        ),
      ),
    );
  }
}
