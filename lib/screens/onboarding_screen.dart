import 'package:flutter/material.dart';
import '../core/constants/app_color.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      headline: 'Tanam Sayur Segar dari Rumah Tanpa Ribet!',
      emojis: ['🥕', '🍅'],
      body:
          'Bersama HydropoMe, menanam sayuran untuk hidup lebih sehat dan hemat jadi lebih mudah!',
      imagePath:
          'assets/onboarding1.png', // Placeholder, bisa diganti dengan path gambar yang sesuai
    ),
    OnboardingPageData(
      headline: 'Belanja Starter Kit & Jual Hasil Panen!',
      emojis: [],
      body:
          'Belanja, jual panen, dan penuhi kebutuhanmu di marketplace kami. Praktis banget buat kamu yang suka berkebun dari rumah!',
      imagePath:
          'assets/onboarding2.png', // Placeholder, bisa diganti dengan path gambar yang sesuai
    ),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  void _goToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      setState(() {
        _currentPage++;
      });
    } else {
      _goToHome();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final currentPageData = _pages[_currentPage];

    return Scaffold(
      body: Stack(
        children: [
          // Gambar hero yang berubah dengan AnimatedSwitcher
          // Gambar harus full background tanpa ClipRRect atau borderRadius
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Image.asset(
                currentPageData.imagePath,
                key: ValueKey<int>(_currentPage),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback jika gambar tidak ditemukan
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColor.primary.withOpacity(0.3),
                          AppColor.primary.withOpacity(0.1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.local_florist,
                        size: 120,
                        color: AppColor.primary.withOpacity(0.5),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Container hijau fixed di bawah dengan kurva melengkung
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.5,
            child: ClipPath(
              clipper: OnboardingClipper(),
              child: Container(
                decoration: const BoxDecoration(color: AppColor.primary),
                // Nilai 'top' harus lebih besar dari 'curveHeight' di clipper
                // 80.0 (curve) + 24.0 (jarak) = 104.0
                padding: const EdgeInsets.fromLTRB(24, 104, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Headline dengan emojis yang berubah
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.0, 0.1),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ),
                            );
                          },
                      child: RichText(
                        key: ValueKey<String>('headline_$_currentPage'),
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                          children: [
                            TextSpan(text: currentPageData.headline),
                            if (currentPageData.emojis.isNotEmpty) ...[
                              const TextSpan(text: ' '),
                              ...currentPageData.emojis.map(
                                (emoji) => TextSpan(text: emoji),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Body text yang berubah
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.0, 0.1),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ),
                            );
                          },
                      child: Text(
                        currentPageData.body,
                        key: ValueKey<String>('body_$_currentPage'),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Navigation bar - tetap di posisinya
                    _buildNavigation(),
                  ],
                ),
              ),
            ),
          ),
          // Skip button
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.greenLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: _goToHome,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Lewati',
                  style: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    // Halaman 1: dots di tengah, arrow forward di kanan
    // Halaman 2: arrow back di kiri, dots di tengah, arrow forward di kanan
    if (_currentPage == 0) {
      // Halaman pertama: dots di tengah, arrow forward di kanan
      return Stack(
        alignment: Alignment.center,
        children: [
          // Dots indicator di tengah (absolute center)
          Align(
            alignment: Alignment.center,
            child: CustomPageIndicator(
            currentPage: _currentPage,
            pageCount: 2,
            activeDotColor: AppColor.activeDot,
            inactiveDotColor: AppColor.inactiveDot.withValues(alpha: 0.2),
            ),
          ),
          // Arrow forward button di pojok kanan
          Align(
            alignment: Alignment.centerRight,
            child: _buildNavButton(
              icon: Icons.chevron_right,
              onPressed: _nextPage,
              isCircular: false,
            ),
          ),
        ],
      );
    } else {
      // Halaman kedua: arrow back di kiri, dots di tengah, arrow forward di kanan
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dots indicator di tengah (absolute center)

          // Arrow back button di kiri
          _buildNavButton(
            icon: Icons.chevron_left,
            onPressed: _previousPage,
            isCircular: false,
          ),
          CustomPageIndicator(
            currentPage: _currentPage,
            pageCount: 2,
            activeDotColor: AppColor.activeDot,
            inactiveDotColor: AppColor.inactiveDot.withValues(alpha: 0.2),
          ),
          // Arrow forward button di kanan
          _buildNavButton(
            icon: Icons.chevron_right,
            onPressed: _nextPage,
            isCircular: false,
          ),
        ],
      );
    }
  }

  Widget _buildNavButton({
    required IconData icon,
    required VoidCallback onPressed,
    bool isCircular = false,
  }) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.navButtonBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Icon(icon, color: Colors.white, size: 24)),
          ),
        ),
      ),
    );
  }
}

class OnboardingPageData {
  final String headline;
  final List<String> emojis;
  final String body;
  final String imagePath;

  OnboardingPageData({
    required this.headline,
    required this.emojis,
    required this.body,
    required this.imagePath,
  });
}

class CustomPageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final Color activeDotColor;
  final Color inactiveDotColor;

  const CustomPageIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
    this.activeDotColor = Colors.white,
    this.inactiveDotColor = Colors.white38,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int index = 0; index < pageCount; index++) ...[
          if (index > 0) const SizedBox(width: 8), // Spacing 8px antara dots
          _buildDot(index == currentPage, index),
        ],
      ],
    );
  }

  Widget _buildDot(bool isActive, int index) {
    // Active dot: 14x14, Inactive dot: 12x12
    const double activeSize = 14.0;
    const double inactiveSize = 12.0;

    return SizedBox(
      width: activeSize,
      height: activeSize,
      child: Center(
        child: AnimatedContainer(
          key: ValueKey('dot_$index'),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isActive ? activeSize : inactiveSize,
          height: isActive ? activeSize : inactiveSize,
          decoration: ShapeDecoration(
            color: isActive ? activeDotColor : inactiveDotColor,
            shape: const OvalBorder(),
          ),
        ),
      ),
    );
  }
}

class OnboardingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Ini adalah 'kedalaman' lekukan ke bawah.
    // Sesuaikan 40.0 ini jika perlu.
    double curveHeight = 40.0;

    path.lineTo(0, 0); // Mulai dari kiri atas
    path.quadraticBezierTo(
      size.width / 2, // Titik kontrol tengah (x)
      curveHeight * 2, // Titik kontrol tengah (y) - ditarik ke BAWAH
      size.width, // Titik akhir (x)
      0, // Titik akhir (y)
    );
    path.lineTo(size.width, size.height); // Garis ke kanan bawah
    path.lineTo(0, size.height); // Garis ke kiri bawah
    path.close(); // Tutup path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
