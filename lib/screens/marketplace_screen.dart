import 'package:flutter/material.dart';
import '../core/constants/app_color.dart';
import '../models/product_model.dart';
import './product_detail_screen.dart';
import './sell_product_screen.dart';
import './cart_screen.dart';

const double _kHeaderHeight = 165.0;
const double _kCurveDepth = 45.0;
const double _kTopPadding = 45.0;

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  String _selectedCategory = 'Starter Kit';

  static final List<ProductModel> _products = [
    ProductModel(
      id: '1',
      name: 'Paket Pipa NFT',
      category: 'Starter Kit',
      price: 'Rp 125.000',
      oldPrice: 'Rp 150.000',
      imagePath: 'assets/paket1.png',
      bgColor: AppColor.greenLight,
      hasDiscount: true,
      hasBonus: true,
      description: 'Basic Starter Kit ini cocok untuk kamu yang baru mulai belajar hidroponik.',
      packageContents: [
        '1 set pipa NFT',
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
      imagePath: 'assets/paket2.png',
      bgColor: AppColor.greenLight,
      hasDiscount: true,
      hasBonus: false,
      description: 'Paket lengkap hidroponik untuk pemula.',
      packageContents: ['5 net pot', 'Rockwool', 'Nutrisi A/B', 'Panduan menanam'],
    ),
    ProductModel(
      id: '3',
      name: 'Paket Lengkap 2',
      category: 'Starter Kit',
      price: 'Rp 75.000',
      oldPrice: 'Rp 80.000',
      imagePath: 'assets/paket3.png',
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
      imagePath: 'assets/sarungtangan.png',
      bgColor: Color(0xFFFFF8F0),
      hasDiscount: true,
      hasBonus: false,
      description: 'Sarung tangan berkebun premium.',
      packageContents: ['Anti air', 'Karet tebal', 'Nyaman', 'Tahan lama'],
    ),
  ];

  static final List<ProductModel> _customerProducts = [
    ProductModel(
      id: '5',
      name: 'Media + Tanaman',
      category: 'Dari Customer',
      price: 'Rp 150.000',
      oldPrice: 'Rp 180.000',
      imagePath: 'assets/mediatanaman.png',
      bgColor: Colors.white,
      hasDiscount: true,
      hasBonus: false,
      description: 'Basic Starter Kit cocok untuk kamu yang baru mulai hidroponik.',
      packageContents: ['NFT 6 lubang', 'Rockwool', 'Nutrisi A/B', '6 Tanaman sawi'],
    ),
    ProductModel(
      id: '6',
      name: 'Nutrisi Hidroponik A/B',
      category: 'Dari Customer',
      price: 'Rp 35.000',
      oldPrice: 'Rp 50.000',
      imagePath: 'assets/nutrisihidroponik.png',
      bgColor: AppColor.greenLight,
      hasDiscount: true,
      hasBonus: false,
      description: 'Nutrisi A/B Mix untuk pertumbuhan sayuran.',
      packageContents: ['500ml Nutrisi A', '500ml Nutrisi B', 'Takaran'],
    ),
    ProductModel(
      id: '7',
      name: 'Net Cup (2 Pcs)',
      category: 'Aksesoris Hidroponik',
      price: 'Rp 15.000',
      oldPrice: 'Rp 30.000',
      imagePath: 'assets/netCup2Picis.jpeg',
      bgColor: AppColor.greenLight,
      hasDiscount: true,
      hasBonus: false,
      description:
          'Net cup berkualitas, kuat, tidak mudah pecah, dan memiliki sirkulasi air optimal.',
      packageContents: [
        '2 buah net cup standar',
        'Material plastik tebal',
        'Cocok untuk rakit apung & NFT',
      ],
    ),
    ProductModel(
      id: '8',
      name: 'Starter Kit Hidroponik',
      category: 'Paket Pemula',
      price: 'Rp 75.000',
      oldPrice: 'Rp 90.000',
      imagePath: 'assets/paketmulai.png',
      bgColor: AppColor.greenLight,
      hasDiscount: true,
      hasBonus: false,
      description:
          'Paket lengkap untuk pemula yang ingin mulai bertanam hidroponik di rumah.',
      packageContents: [
        '500ml Nutrisi A',
        '500ml Nutrisi B',
        'Satu set takaran nutrisi',
        'Panduan penggunaan',
      ],
    ),
  ];

  List<ProductModel> get _filteredProducts {
    if (_selectedCategory == 'Starter Kit') return _products;
    if (_selectedCategory == 'Dari Customer') return _customerProducts;
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          _buildCurvedHeader(),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                _buildSearchAndCart(context),
                SizedBox(height: 10),
                _buildCategoryTabs(),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: _buildProductGrid(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurvedHeader() {
    return ClipPath(
      clipper: _CurvedHeaderClipper(),
      child: Container(height: _kHeaderHeight, color: AppColor.primary),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, _kTopPadding, 20, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Marketplace',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
              _buildSellButton(context),
            ],
          ),
          SizedBox(height: _kHeaderHeight - _kTopPadding - 100 + 30),
        ],
      ),
    );
  }

  Widget _buildSellButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SellProductScreen()),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.activeDot,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Colors.white, size: 18),
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
    );
  }

  Widget _buildSearchAndCart(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(child: _buildSearchBar()),
          SizedBox(width: 12),
          _buildCartButton(context),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari di marketplace...',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 22),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildCartButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CartScreen()),
      ),
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
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: AppColor.primary,
              size: 24,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 8, 20, 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCategoryChip('Starter Kit'),
            SizedBox(width: 10),
            _buildCategoryChip('Dari Customer'),
            SizedBox(width: 10),
            _buildCategoryChip('Media Tanam'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    final isSelected = _selectedCategory == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.activeDot : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppColor.activeDot : Colors.grey,
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
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.68,
      ),
      itemCount: _filteredProducts.length,
      itemBuilder: (context, i) =>
          _buildProductCard(context, _filteredProducts[i]),
    );
  }

  Widget _buildProductCard(BuildContext context, ProductModel product) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: product),
        ),
      ),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildProductImage(product), _buildProductInfo(product)],
        ),
      ),
    );
  }

  Widget _buildProductImage(ProductModel product) {
    return Stack(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            color: product.bgColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(0.5),
            child: Image.asset(
              product.imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        if (product.hasDiscount || product.hasBonus)
          Positioned(top: 8, right: 8, child: _buildBadge(product)),
      ],
    );
  }

  Widget _buildBadge(ProductModel product) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: product.hasBonus ? AppColor.activeDot : Colors.redAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        product.hasBonus ? 'Bonus' : 'Promo',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProductInfo(ProductModel product) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.category,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E1E1E),
              height: 1.2,
            ),
          ),
          SizedBox(height: 4),
          _buildPriceRow(product),
        ],
      ),
    );
  }

  Widget _buildPriceRow(ProductModel product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          product.price,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColor.activeDot,
          ),
        ),
        if (product.hasDiscount) ...[
          SizedBox(width: 6),
          Expanded(
            child: Text(
              product.oldPrice,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _CurvedHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - _kCurveDepth);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + _kCurveDepth,
      size.width,
      size.height - _kCurveDepth,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
