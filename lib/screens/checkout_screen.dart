import 'package:flutter/material.dart';
import '../core/constants/app_color.dart';
import '../models/cart_item.dart';
import './qris_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  const CheckoutScreen({super.key, this.cartItems = const []});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? _selectedPaymentMethod;
  static const int _defaultShipping = 10000;

  @override
  Widget build(BuildContext context) {
    final int subtotal = _calculateSubtotal();
    final int shipping = _defaultShipping;
    final int grandTotal = subtotal + shipping;

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
          'Pemesanan',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Detail Pemesanan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              _buildProductItem(),
              const SizedBox(height: 24),
              const Text(
                'Alamat',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              _buildAddressCard(),
              const SizedBox(height: 24),
              const Text(
                'Metode Pembayaran',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              _buildPaymentCard(),
              const SizedBox(height: 24),
              _buildSummary(subtotal, shipping, grandTotal),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  int _parsePrice(String? price) {
    if (price == null || price.isEmpty) return 0;
    final digits = price.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(digits) ?? 0;
  }

  String _formatCurrency(int value) {
    final s = value.toString();
    final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return s.replaceAllMapped(reg, (m) => '${m[1]}.');
  }

  int _calculateSubtotal() {
    var total = 0;
    for (final item in widget.cartItems) {
      total += _parsePrice(item.product.price) * item.quantity;
    }
    return total;
  }

  Widget _buildProductItem() {
    if (widget.cartItems.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColor.greenLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.inventory_2_outlined, size: 28, color: Colors.grey[300]),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Tidak ada item di keranjang',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    }

    final first = widget.cartItems.first;
    final product = first.product;
    final qty = first.quantity;
    final priceInt = _parsePrice(product.price);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: product.bgColor ?? AppColor.greenLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.inventory_2_outlined, size: 28, color: Colors.grey[300]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(product.category, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                const SizedBox(height: 4),
                Text('Jumlah produk: ${qty}pcs', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Rp ${_formatCurrency(priceInt)}',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.activeDot),
                    ),
                    const SizedBox(width: 8),
                    if ((product.oldPrice ?? '').isNotEmpty)
                      Text(
                        product.oldPrice!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(6)),
            child: Text(
              'x$qty',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Mella - 081324567890',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
          const SizedBox(height: 8),
          Text(
            'Jl. Jasa 2 Motomulyo No 1 | Buah Batu Square, Kecamatan Bandung Kidul, Kota Bandung, Jawa Barat',
            style: TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.5),
          ),
          const SizedBox(height: 12),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Icon(Icons.map_outlined, size: 40, color: Colors.grey[400])),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard() {
    return InkWell(
      onTap: () => setState(() => _selectedPaymentMethod = 'QRIS'),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(
            color: _selectedPaymentMethod == 'QRIS' ? AppColor.activeDot : Colors.grey[200]!,
            width: _selectedPaymentMethod == 'QRIS' ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration:
                  BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
              child: Icon(Icons.qr_code, size: 24, color: Colors.grey[600]),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('QRIS',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
                  SizedBox(height: 2),
                  Text('Hanya tersedia QRIS',
                      style: TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
            Radio<String>(
              value: 'QRIS',
              groupValue: _selectedPaymentMethod,
              onChanged: (v) => setState(() => _selectedPaymentMethod = v),
              activeColor: AppColor.activeDot,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary(int subtotal, int shipping, int grandTotal) {
    final totalQty =
        widget.cartItems.fold<int>(0, (p, e) => p + e.quantity);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildSummaryRow('Paket Lengkap', subtotal),
          const SizedBox(height: 8),
          _buildSummaryRow('Jumlah Produk', totalQty, isQuantity: true),
          const SizedBox(height: 8),
          _buildSummaryRow('Subtotal', subtotal),
          const SizedBox(height: 8),
          _buildSummaryRow('Ongkos Kirim', shipping),
          const Divider(height: 24, thickness: 1),
          _buildSummaryRow('Total Harga', grandTotal, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, int value,
      {bool isTotal = false, bool isQuantity = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 15 : 13,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: isTotal ? Colors.black87 : Colors.grey[700],
          ),
        ),
        Text(
          isQuantity ? value.toString() : 'Rp ${_formatCurrency(value)}',
          style: TextStyle(
            fontSize: isTotal ? 16 : 13,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
            color: isTotal ? AppColor.activeDot : Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final bool isPaymentSelected = _selectedPaymentMethod != null;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2))
        ],
        color: Colors.white,
      ),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: isPaymentSelected
              ? () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => QrisScreen()));
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isPaymentSelected ? AppColor.activeDot : Colors.grey[300],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
          ),
          child: const Text('Bayar Sekarang',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
