// lib/screens/cart_screen.dart

import 'package:flutter/material.dart';
import '../core/constants/app_color.dart';
import '../models/product_model.dart';
import '../models/cart_item.dart';
import './checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> _cartItems = [
    CartItem(
      product: ProductModel(
        id: '2',
        name: 'Paket Lengkap',
        category: 'Starter Kit',
        price: 'Rp 25.000',
        oldPrice: 'Rp 40.000',
        imagePath: 'assets/paket2.png',
        bgColor: AppColor.greenLight,
        hasDiscount: true,
        hasBonus: false,
        description: 'Paket lengkap hidroponik untuk pemula.',
        packageContents: ['5 net pot', 'Rockwool', 'Nutrisi A/B', 'Panduan'],
      ),
      quantity: 1,
      isSelected: false,
    ),
    CartItem(
      product: ProductModel(
        id: '2',
        name: 'Paket Lengkap',
        category: 'Starter Kit',
        price: 'Rp 25.000',
        oldPrice: 'Rp 40.000',
        imagePath: 'assets/paket2.png',
        bgColor: AppColor.greenLight,
        hasDiscount: true,
        hasBonus: false,
        description: 'Paket lengkap hidroponik untuk pemula.',
        packageContents: ['5 net pot', 'Rockwool', 'Nutrisi A/B', 'Panduan'],
      ),
      quantity: 1,
      isSelected: false,
    ),
    CartItem(
      product: ProductModel(
        id: '2',
        name: 'Paket Lengkap',
        category: 'Starter Kit',
        price: 'Rp 25.000',
        oldPrice: 'Rp 40.000',
        imagePath: 'assets/paket2.png',
        bgColor: AppColor.greenLight,
        hasDiscount: true,
        hasBonus: false,
        description: 'Paket lengkap hidroponik untuk pemula.',
        packageContents: ['5 net pot', 'Rockwool', 'Nutrisi A/B', 'Panduan'],
      ),
      quantity: 1,
      isSelected: false,
    ),
  ];

  int _calculateTotal() {
    int total = 0;
    for (var item in _cartItems) {
      if (item.isSelected) {
        total += item.product.priceValue * item.quantity;
      }
    }
    return total;
  }

  bool _hasSelectedItems() {
    return _cartItems.any((item) => item.isSelected);
  }

  void _goToCheckout() {
    final selectedItems = _cartItems.where((item) => item.isSelected).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutScreen(cartItems: selectedItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Keranjang Saya',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _cartItems.isEmpty
          ? _buildEmptyCart()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                return _buildCartItem(_cartItems[index], index);
              },
            ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'Keranjang kosong',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Checkbox
          Checkbox(
            value: item.isSelected,
            onChanged: (val) {
              setState(() {
                item.isSelected = val ?? false;
              });
            },
            activeColor: AppColor.activeDot,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: item.product.bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(item.product.imagePath, fit: BoxFit.cover),
          ),

          const SizedBox(width: 12),

          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  item.product.category,
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      item.product.price,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColor.activeDot,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.product.oldPrice,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Quantity Controls + Delete
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Delete button
              InkWell(
                onTap: () {
                  setState(() {
                    _cartItems.removeAt(index);
                  });
                },
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Quantity
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildQuantityButton(
                    icon: Icons.remove,
                    onTap: () {
                      if (item.quantity > 1) {
                        setState(() {
                          item.quantity--;
                        });
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      '${item.quantity}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _buildQuantityButton(
                    icon: Icons.add,
                    onTap: () {
                      setState(() {
                        item.quantity++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 16, color: Colors.black54),
      ),
    );
  }

  Widget _buildBottomBar() {
    final total = _calculateTotal();
    final hasSelected = _hasSelectedItems();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Harga',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rp ${total.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.activeDot,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: hasSelected ? _goToCheckout : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: hasSelected
                      ? AppColor.activeDot
                      : Colors.grey[300],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Pesan Sekarang',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
