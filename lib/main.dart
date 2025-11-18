import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HydroPoMe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.plusJakartaSansTextTheme()),
      home: const SplashScreen(),
    );
  }
}
