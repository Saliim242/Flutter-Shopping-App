import 'package:flutter/material.dart';
import 'package:just_eccomerce_app/data/product_data.dart';
import 'package:just_eccomerce_app/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  bool isLoading = false;

  Future<void> loadProducts() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    products = ProductData.map((data) => ProductModel.fromJson(data)).toList();

    isLoading = false;
    notifyListeners();
  }
}
