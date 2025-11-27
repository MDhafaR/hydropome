import 'package:flutter/material.dart';
import 'package:hydropome/core/constants/app_color.dart';
import 'package:hydropome/core/data/personalization_data.dart';
import 'package:hydropome/screens/main.navigation.dart';
import 'package:hydropome/widgets/personalization_question_cards.dart';

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

class PersonalizationScreen extends StatefulWidget {
  const PersonalizationScreen({super.key});

  @override
  State<PersonalizationScreen> createState() => _PersonalizationScreenState();
}

class _PersonalizationScreenState extends State<PersonalizationScreen> {
  // Current question set (0 = first set, 1 = second set, 2 = third set)
  int _currentQuestionSet = 0;

  // Store selected options for all questions
  // For single choice: String?, for multiple choice: List<String>
  late List<dynamic> _selectedOptions1;
  late List<dynamic> _selectedOptions2;
  late List<dynamic> _selectedOptions3;

  // Scroll tracking
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    // Initialize selected options for first set (all single choice)
    _selectedOptions1 = List.filled(
      PersonalizationData.questionOptions1.length,
      null,
    );
    // Initialize selected options for second set
    _selectedOptions2 = List.filled(
      PersonalizationData.questionOptions2.length,
      null,
    );
    // First question in second set is multiple choice, so initialize with empty list
    _selectedOptions2[0] = <String>[];

    // Initialize selected options for third set (all single choice)
    _selectedOptions3 = List.filled(
      PersonalizationData.questionOptions3.length,
      null,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleOptionChanged(int index, dynamic value) {
    setState(() {
      if (_currentQuestionSet == 0) {
        _selectedOptions1[index] = value;
      } else if (_currentQuestionSet == 1) {
        _selectedOptions2[index] = value;
      } else {
        _selectedOptions3[index] = value;
      }
    });
  }

  void _handleNextPressed() {
    if (_currentQuestionSet == 0) {
      // Move to second question set
      setState(() {
        _currentQuestionSet = 1;
        _scrollOffset = 0.0; // Reset scroll position
        _scrollController.jumpTo(0); // Reset scroll controller
      });
    } else if (_currentQuestionSet == 1) {
      // Move to third question set
      setState(() {
        _currentQuestionSet = 2;
        _scrollOffset = 0.0; // Reset scroll position
        _scrollController.jumpTo(0); // Reset scroll controller
      });
    } else {
      // Handle final submission or next screen
      // TODO: Navigate to next screen or submit data
      // You can access all answers here:
      // _selectedOptions1, _selectedOptions2, _selectedOptions3
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainNavigation()),
      );
    }
  }

  void _handleScrollChanged(double offset) {
    setState(() {
      _scrollOffset = offset;
    });
  }

  List<dynamic> get _currentSelectedOptions {
    if (_currentQuestionSet == 0) {
      return _selectedOptions1;
    } else if (_currentQuestionSet == 1) {
      return _selectedOptions2;
    } else {
      return _selectedOptions3;
    }
  }

  List<PersonalizationQuestion> get _currentQuestions {
    if (_currentQuestionSet == 0) {
      return PersonalizationData.questionOptions1;
    } else if (_currentQuestionSet == 1) {
      return PersonalizationData.questionOptions2;
    } else {
      return PersonalizationData.questionOptions3;
    }
  }

  String get _pageIndicator {
    if (_currentQuestionSet == 0) {
      return '1/3';
    } else if (_currentQuestionSet == 1) {
      return '2/3';
    } else {
      return '3/3';
    }
  }

  String get _buttonText {
    return _currentQuestionSet == 2 ? 'Simpan' : 'Selanjutnya';
  }

  // Fungsi untuk menghitung tinggi background putih berdasarkan scroll
  // Awal: 0.7, scroll ke atas: bertambah hingga 1.0
  double _calculateWhiteBackgroundHeight(double screenHeight) {
    final double maxScroll = 120.0; // Maksimal scroll untuk animasi penuh
    final double minHeight = 0.7; // Tinggi awal (70%)
    final double maxHeight = 1.0; // Tinggi maksimal (100%)

    // Hitung progress scroll (0.0 = belum scroll, 1.0 = scroll maksimal)
    final double scrollProgress = (_scrollOffset / maxScroll).clamp(0.0, 1.0);

    // Interpolasi dari 0.7 ke 1.0
    final double heightFactor =
        minHeight + (maxHeight - minHeight) * scrollProgress;

    return screenHeight * heightFactor;
  }

  // Fungsi untuk menghitung warna appbar berdasarkan scroll
  // Awal: transparan, scroll ke atas: semakin putih
  Color _calculateAppBarColor() {
    final double maxScroll = 120.0;
    final double scrollProgress = (_scrollOffset / maxScroll).clamp(0.0, 1.0);

    // Interpolasi dari transparan ke putih
    return Color.lerp(Colors.transparent, Colors.white, scrollProgress)!;
  }

  // Fungsi untuk menghitung warna text/icon berdasarkan scroll
  // Awal: putih, scroll ke atas: semakin hitam
  Color _calculateAppBarTextColor() {
    final double maxScroll = 120.0;
    final double scrollProgress = (_scrollOffset / maxScroll).clamp(0.0, 1.0);

    // Interpolasi dari putih ke hitam
    return Color.lerp(Colors.white, Colors.black87, scrollProgress)!;
  }

  // Fungsi untuk menghitung warna button background berdasarkan scroll
  Color _calculateButtonBackgroundColor() {
    final double maxScroll = 120.0;
    final double scrollProgress = (_scrollOffset / maxScroll).clamp(0.0, 1.0);

    // Interpolasi dari hitam transparan ke abu-abu transparan
    return Color.lerp(
      AppColor.buttonBg.withValues(alpha: 0.2),
      AppColor.buttonBg.withValues(alpha: 1.0),
      scrollProgress,
    )!;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            color: _calculateAppBarColor(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Button
                    Container(
                      decoration: BoxDecoration(
                        color: _calculateButtonBackgroundColor(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: _calculateAppBarTextColor(),
                        ),
                        onPressed: () {
                          if (_currentQuestionSet > 0) {
                            // Go back to previous question set
                            setState(() {
                              _currentQuestionSet--;
                              _scrollOffset = 0.0;
                              _scrollController.jumpTo(0);
                            });
                          } else {
                            // Exit personalization screen
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ),
                    // Page Indicator
                    Row(
                      children: [
                        Text(
                          _pageIndicator,
                          style: TextStyle(
                            color: _calculateAppBarTextColor(),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            // Handle skip action
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: _calculateButtonBackgroundColor(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Lewati',
                            style: TextStyle(
                              color: _calculateAppBarTextColor(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(color: AppColor.primary),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOutCubic,
                    child: ClipPath(
                      clipper: OnboardingClipper(),
                      child: Container(
                        width: double.infinity,
                        height: _calculateWhiteBackgroundHeight(screenHeight),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                PersonalizationQuestionCards(
                  questions: _currentQuestions,
                  selectedOptions: _currentSelectedOptions,
                  onOptionChanged: _handleOptionChanged,
                  onNextPressed: _handleNextPressed,
                  scrollController: _scrollController,
                  onScrollChanged: _handleScrollChanged,
                  buttonText: _buttonText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
