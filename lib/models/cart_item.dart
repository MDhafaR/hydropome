import './product_model.dart';

class CartItem {
  final ProductModel product;
  int quantity;
  bool isSelected;

  CartItem({
    required this.product,
    required this.quantity,
    this.isSelected = false,
  });
}