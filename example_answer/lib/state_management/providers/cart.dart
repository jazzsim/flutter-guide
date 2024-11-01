import 'package:example_answer/state_management/product.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _products = [];
  double _totalPrice = 0;
  int _totalCount = 0;

  int get totalCount => _totalCount;

  double get totalPrice => _totalPrice;

  List<Product> get products => _products;

  void calculatePrice() {
    double newTotalPrice = 0;
    for (var product in _products) {
      for (var i = 0; i < product.count; i++) {
        newTotalPrice += product.price;
      }
    }
    _totalPrice = newTotalPrice;
    notifyListeners();
  }

  void removeProduct(Product product) {
    int index = _products.indexWhere((e) => e.name == product.name);
    if (index != -1) {
      if (_products[index].count == 1) {
        _products.remove(product);
      } else {
        _products[index].decrement();
      }
      calculatePrice();

      _totalCount--;
      notifyListeners();
    } else {
      // err
      throw Exception("Product Not Found");
    }
  }

  void addProduct(Product product) {
    int index = _products.indexWhere((e) => e.name == product.name);
    if (index == -1) {
      _products.add(product);
    } else {
      _products[index].increment();
    }
    calculatePrice();

    _totalCount++;
    notifyListeners();
  }
}
