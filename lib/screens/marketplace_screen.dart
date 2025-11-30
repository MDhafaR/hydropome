// lib/screens/marketplace_screen.dart

import 'package:flutter/material.dart';
import '../core/constants/app_color.dart';
import '../models/product_model.dart';
import './product_detail_screen.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  // Sample product data
  List<ProductModel> get _products => [
        ProductModel(
          id: '1',
          name: 'Paket Pipa NFT',
          category: 'Starter Kit',
          price: 'Rp 125.000',
          oldPrice: 'Rp 150.000',
          imagePath: 'assets/product1.png',
          bgColor: AppColor.greenLight,
          hasDiscount: true,
          hasBonus: true,
          description:
              'Basic Starter Kit ini cocok untuk kamu yang baru mulai belajar hidroponik di rumah. Sistem pipa NFT (Nutrient Film Technique) sangat populer karena perawatannya yang mudah dan efisien. Sistem kit ini sudah termasuk peralatan dasar untuk memulai menanam sayuran seperti selada, bayam, dan lain-lain.',
          packageContents: [
            '1 set pipa NFT (tidak tanaman)',
            'Pompa air 1 selang',
            'Net pot',
            'Rockwool',
            'Nutrisi A/B Mix',
            'Buku panduan + link tutorial video',
          ],
        ),
        ProductModel(
          id: '2',
          name: 'Paket Lengkap',
          category: 'Starter Kit',
          price: 'Rp 55.000',
          oldPrice: 'Rp 75.000',
          imagePath: 'assets/product2.png',
          bgColor: AppColor.greenLight,
          hasDiscount: true,
          hasBonus: false,
          description:
              'Paket lengkap hidroponik untuk pemula dengan sistem wick yang mudah digunakan.',
          packageContents: [
            '5 net pot ukuran sedang',
            'Rockwool media tanam',
            'Nutrisi hidroponik A/B',
            'Panduan penanaman',
          ],
        ),
        ProductModel(
          id: '3',
          name: 'Paket Lengkap 2',
          category: 'Starter Kit',
          price: 'Rp 75.000',
          oldPrice: 'Rp 80.000',
          imagePath: 'assets/product3.png',
          bgColor: AppColor.greenLight,
          hasDiscount: true,
          hasBonus: false,
          description:
              'Paket hidroponik dengan sistem DFT untuk hasil panen maksimal.',
          packageContents: [
            'Container hidroponik DFT',
            '10 net pot',
            'Aerator dan selang',
            'Nutrisi lengkap 1 bulan',
          ],
        ),
        ProductModel(
          id: '4',
          name: 'Sarung Tangan',
          category: 'Starter Kit',
          price: 'Rp 25.000',
          oldPrice: 'Rp 50.000',
          imagePath: 'assets/product4.png',
          bgColor: const Color(0xFFFFF4E6),
          hasDiscount: true,
          hasBonus: false,
          description:
              'Sarung tangan berkebun premium untuk melindungi tangan saat berkebun.',
          packageContents: [
            'Sarung tangan anti air',
            'Bahan karet tebal',
            'Nyaman digunakan',
            'Tahan lama',
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildCategoryTabs(),
            _buildProductGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: AppColor.primary,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Marketplace',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColor.activeDot,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.add, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Jual Produk',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari di marketplace...',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 8),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey[400],
                          size: 22,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColor.primary,
                      size: 24,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: const Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCategoryChip('Starter Kit', isSelected: true),
            const SizedBox(width: 8),
            _buildCategoryChip('Dari Customer', isSelected: false),
            const SizedBox(width: 8),
            _buildCategoryChip('Media Tanam', isSelected: false),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.activeDot : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColor.activeDot : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[700],
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.68,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return _buildProductCard(context, product);
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, ProductModel product) {
    return InkWell(
      onTap: () {
        // NAVIGATE TO PRODUCT DETAIL
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: product.bgColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.inventory_2_outlined,
                      size: 50,
                      color: Colors.grey[300],
                    ),
                  ),
                  if (product.hasDiscount)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'DISKON',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.activeDot,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product.oldPrice,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}