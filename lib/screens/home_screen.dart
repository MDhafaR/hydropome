import 'package:flutter/material.dart';
import '../core/constants/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HydroPoMe'),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Welcome to HydroPoMe')),
    );
  }
}

