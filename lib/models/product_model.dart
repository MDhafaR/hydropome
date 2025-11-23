// lib/models/product_model.dart
import 'package:flutter/material.dart';

class ProductModel {
  final String id;
  final String name;
  final String category;
  final String price;
  final String oldPrice;
  final String imagePath;
  final Color bgColor;
  final bool hasDiscount;
  final bool hasBonus;
  final String description;
  final List<String> packageContents;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.oldPrice,
    required this.imagePath,
    required this.bgColor,
    this.hasDiscount = false,
    this.hasBonus = false,
    required this.description,
    required this.packageContents,
  });

  // Helper method untuk parse harga (remove "Rp" dan titik)
  int get priceValue {
    return int.parse(price.replaceAll(RegExp(r'[^\d]'), ''));
  }

  int get oldPriceValue {
    return int.parse(oldPrice.replaceAll(RegExp(r'[^\d]'), ''));
  }

  // Calculate discount percentage
  int get discountPercentage {
    if (oldPriceValue == 0) return 0;
    return ((oldPriceValue - priceValue) / oldPriceValue * 100).round();
  }
}
