import 'package:flutter/material.dart';
import 'package:just_eccomerce_app/data/cart_item_model.dart';
import 'package:just_eccomerce_app/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> cartItems = [];

  // Check if a product is already in the cart

  bool isInCart(ProductModel product) {
    return cartItems.any((item) => item.product.id == product.id);
  }

  void addToCart(ProductModel product) {
    print("Called addToCart with product: ${product.name}");
    int index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(CartItemModel(product: product, quantity: 1));
    }

    notifyListeners();
  }

  // get total items in the cart
  int get totalItems {
    int total = 0;

    for (var item in cartItems) {
      total += item.quantity;
    }

    return total;
  }

  // get Total Price
  double get totalPrice {
    double total = 0;

    for (var item in cartItems) {
      total += item.product.price * item.quantity;
    }

    return total;
  }

  // // Increase quantity

  void incrementQuantity(ProductModel product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      cartItems[index].quantity++;
      notifyListeners();
    }
  }

  // decrease quantity

  void decrementQuantity(ProductModel product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
        notifyListeners();
      } else {
        // cartItems.removeAt(index);
        // notifyListeners();
      }
    }
  }

  // Remove from cart

  void removeFromCart(ProductModel product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      cartItems.removeAt(index);
      notifyListeners();
    }
  }

  // clear

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }
}
