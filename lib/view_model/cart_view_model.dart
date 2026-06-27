import 'package:ecommerce_app/model/cart_model.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartModel> _cart = [];

  List<CartModel> get cart => _cart;

  // Total number of items
  int get cartCount => _cart.length;

  // Add item — if same item exists just increase quantity
  void addtoCart(CartModel newItem) {
    int index = _cart.indexWhere((item) => item.title == newItem.title);

    if (index != -1) {
      // Item already in cart, just increase quantity
      _cart[index].quantity = _cart[index].quantity + newItem.quantity;
    } else {
      // New item, add to cart
      _cart.add(newItem);
    }

    notifyListeners();
  }

  // Plus button
  void increaseQuantity(CartModel item) {
    int index = _cart.indexWhere((e) => e.title == item.title);

    if (index != -1) {
      _cart[index].quantity = _cart[index].quantity + 1;
      notifyListeners();
    }
  }

  // Minus button
  void decreaseQuantity(CartModel item) {
    int index = _cart.indexWhere((e) => e.title == item.title);

    if (index != -1) {
      if (_cart[index].quantity > 1) {
        // Just decrease quantity
        _cart[index].quantity = _cart[index].quantity -1;
      } 
      notifyListeners();
    }
  }

  // Delete button
  void removeCart(CartModel item) {
    _cart.removeWhere((e) => e.title == item.title);
    notifyListeners();
  }

  // Total price of all items
  double get totalPrice {
    double total = 0;

    for (int i = 0; i < _cart.length; i++) {
      double itemPrice = getPrice(_cart[i].price);
      double itemTotal = itemPrice * _cart[i].quantity;
      total = total + itemTotal;
    }

    return total;
  }

  // Show total as "Rs.10000"
  String get formattedTotal {
    return 'Rs.${totalPrice.toStringAsFixed(0)}';
  }

  // Show single item total as "Rs.5000"
  String getItemTotal(CartModel item) {
    double itemPrice = getPrice(item.price);
    double itemTotal = itemPrice * item.quantity;
    return 'Rs.${itemTotal.toStringAsFixed(0)}';
  }

  // Remove "Rs." and "," and return just the number
  // Example: "Rs.1,50,000" => 150000
  double getPrice(String price) {
    String onlyNumbers = price.replaceAll(RegExp(r'[^0-9]'), '');
    if (onlyNumbers.isEmpty) return 0;
    return double.tryParse(onlyNumbers) ?? 0;
  }
}
