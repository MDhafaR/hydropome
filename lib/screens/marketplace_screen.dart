// lib/screens/marketplace_screen.dart

import 'package:flutter/material.dart';
import '../core/constants/app_color.dart';
import '../models/product_model.dart';
import './product_detail_screen.dart';
import './sell_product_screen.dart';
import './cart_screen.dart';

const double _kHeaderHeight = 185.0;
const double _kCurveDepth = 45.0;

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

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
              'Basic Starter Kit ini cocok untuk kamu yang baru mulai belajar hidroponik.',
          packageContents: [
            '1 set pipa NFT (tidak tanaman)',
            'Pompa air 1 selang',
            'Net pot',
            'Rockwool',
            'Nutrisi A/B Mix',
            'Panduan lengkap',
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
          description: 'Paket lengkap hidroponik untuk pemula.',
          packageContents: [
            '5 net pot',
            'Rockwool',
            'Nutrisi A/B',
            'Panduan menanam',
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
          description: 'Paket hidroponik sistem DFT.',
          packageContents: [
            'Container DFT',
            '10 net pot',
            'Aerator',
            'Nutrisi 1 bulan',
          ],
        ),
        ProductModel(
          id: '4',
          name: 'Sarung Tangan',
          category: 'Starter Kit',
          price: 'Rp 25.000',
          oldPrice: 'Rp 50.000',
          imagePath: 'assets/product4.png',
          bgColor: Color(0xFFFFF4E6),
          hasDiscount: true,
          hasBonus: false,
          description: 'Sarung tangan berkebun premium.',
          packageContents: [
            'Anti air',
            'Karet tebal',
            'Nyaman',
            'Tahan lama',
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    const double topPadding = 45.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          ClipPath(
            clipper: _CurvedHeaderClipper(),
            child: Container(
              height: _kHeaderHeight,
              color: AppColor.primary,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, topPadding, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Marketplace',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.3,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SellProductScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.activeDot,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.add,
                                      color: Colors.white, size: 18),
                                  SizedBox(width: 6),
                                  Text(
                                    'Jual Produk',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _kHeaderHeight - topPadding - 100 + 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 8,
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
                              prefixIcon: Icon(Icons.search,
                                  color: Colors.grey[400], size: 22),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CartScreen(),
                            ),
                          );
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.06),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
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
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: const Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                _buildCategoryTabs(),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: _buildProductGrid(context),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCategoryChip('Starter Kit', isSelected: true),
            const SizedBox(width: 10),
            _buildCategoryChip('Dari Customer', isSelected: false),
            const SizedBox(width: 10),
            _buildCategoryChip('Media Tanam', isSelected: false),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.activeDot : Colors.white,
        borderRadius: BorderRadius.circular(24),
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
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: _products.length,
      itemBuilder: (context, i) => _buildProductCard(context, _products[i]),
    );
  }

  Widget _buildProductCard(BuildContext context, ProductModel product) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 3),
            )
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
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.inventory_2_outlined,
                      size: 54,
                      color: Colors.grey[300],
                    ),
                  ),
                  if (product.hasDiscount)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'DISKON',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      product.price,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColor.activeDot,
                      ),
                    ),
                    Text(
                      product.oldPrice,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[500],
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurvedHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final curveHeight = _kCurveDepth;

    path.lineTo(0, size.height - curveHeight);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + curveHeight,
      size.width,
      size.height - curveHeight,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
