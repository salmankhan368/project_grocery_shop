import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
//list item on sale
  final List _shopItem = [
//itemName,price,image,color
    ["Avcado", "4.00", "Images/avcado.jpg", Colors.green],
    ["Banana", "2.50", "Images/banana.jpg", Colors.yellow],
    ["Chicken", "12.00", "Images/chicken.jpg", Colors.brown],
    ["Water", "2.00", "Images/water.jpg", Colors.blue],
  ];
  //list of cartitem
  List _cartItem = [];
  get shopItem => _shopItem;
  get cartItem => _cartItem;
  //add item to cart
  void addItemToCart(int index) {
    _cartItem.add(_shopItem[index]);
    return notifyListeners();
  }

  //remove item to cart
  void removeItemFromCart(int index) {
    _cartItem.removeAt(index);
    return notifyListeners();
  }

  //calculate item to cart
  String calculateTotal() {
    double totalPrice = 0.0;
    for (int i = 0; i < _cartItem.length; i++) {
      totalPrice += double.parse(cartItem[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
