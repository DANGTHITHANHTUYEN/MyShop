import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../models/cart_item.dart';

class CartManager with ChangeNotifier {
  Map<String, CartItem> _items = {
    'p1': CartItem(
      id: 'c1',
      title: 'Red Shirt',
      price: 29.99,
      quantify: 2,
    ),
  };
  int get productCount {
    return _items.length;
  }

  List<CartItem> get products {
    return _items.values.toList();
  }

  Iterable<MapEntry<String, CartItem>> get productEntries {
    return {..._items}.entries;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantify;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (existingCartItem) => existingCartItem.copyWith(
          quantify: existingCartItem.quantify + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: 'c${DateTime.now().toIso8601String()}',
          title: product.title,
          price: product.price,
          quantify: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]?.quantify as num > 1) {
      _items.update(
        productId,
        (existingCartItem) => existingCartItem.copyWith(
          quantify: existingCartItem.quantify - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
