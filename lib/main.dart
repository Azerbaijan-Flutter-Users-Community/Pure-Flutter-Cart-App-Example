import 'package:flutter/material.dart';

import './presentation/pages/products_page.dart';
import './providers/view_model_provider.dart';
import './view_models/cart_list_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/products',
      routes: {
        '/products': (_) => ViewModelProvider<CartListViewModel>(
              viewModel: CartListViewModel(),
              child: ProductsPage(),
            ),
      },
    );
  }
}
