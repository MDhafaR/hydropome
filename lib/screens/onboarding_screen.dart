import 'package:flutter/material.dart';
import 'package:hydropome/screens/login_screen.dart';
import '../core/constants/app_color.dart';
import 'register_screen.dart';

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
      imagePath: 'assets/onboarding1.png',
    ),
    OnboardingPageData(
      headline: 'Belanja Starter Kit & Jual Hasil Panen!',
      emojis: [],
      body:
          'Belanja, jual panen, dan penuhi kebutuhanmu di marketplace kami. Praktis banget buat kamu yang suka berkebun dari rumah!',
      imagePath: 'assets/onboarding2.png',
    ),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  void _goTLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      setState(() {
        _currentPage++;
      });
    } else {
      _goTLogin();
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
                padding: EdgeInsets.only(
                  left: 18,
                  right: 18,
                  top: 120,
                  bottom: 70,
                ),
                decoration: const BoxDecoration(color: AppColor.primary),
                child: Column(
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
                        textAlign: TextAlign.center,
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
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const Spacer(),
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
                onPressed: _goTLogin,
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
    if (_currentPage == 0) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: CustomPageIndicator(
              currentPage: _currentPage,
              pageCount: 2,
              activeDotColor: AppColor.activeDot,
              inactiveDotColor: AppColor.inactiveDot.withValues(alpha: 0.2),
              currentPage: _currentPage,
              pageCount: 2,
              activeDotColor: AppColor.activeDot,
              inactiveDotColor: AppColor.inactiveDot.withValues(alpha: 0.2),
            ),
          ),
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
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
          if (index > 0) const SizedBox(width: 8),
          _buildDot(index == currentPage, index),
        ],
      ],
    );
  }

  Widget _buildDot(bool isActive, int index) {
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
    double curveHeight = 40.0;

    path.lineTo(0, 0);
    path.quadraticBezierTo(
      size.width / 2,
      curveHeight * 2,
      size.width,
      0,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}