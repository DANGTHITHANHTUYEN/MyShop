import 'package:flutter/material.dart';
import 'package:myshop/ui/cart/cart_screen.dart';
import 'package:myshop/ui/orders/orders_screen.dart';
import 'ui/products/products_manager.dart';
import 'ui/products/product_detail_screen.dart';
import 'ui/products/products_overview_screen.dart';
import 'ui/products/user_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.orange,
        ),
      ),
      home: const ProductsOverviewScreen(),
      routes: {
        CartScreen.routeName: 
          (ctx) => const CartScreen(),
        OrdersScreen.routeName: 
          (ctx) => const OrdersScreen(),
        UserProductsScreen.routeName: 
          (ctx) => const UserProductsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailScreen.routeName) {
          final productId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (ctx) {
              return ProductDetailScreen(
                ProductsManager().findById(productId),
              );
            },
          );
        }
        return null;
      },
    );
  }
}
