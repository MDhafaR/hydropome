// lib/screens/qris_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import '../core/constants/app_color.dart';
import './payment_success_screen.dart';

class QrisScreen extends StatefulWidget {
  const QrisScreen({super.key});

  @override
  State<QrisScreen> createState() => _QrisScreenState();
}

class _QrisScreenState extends State<QrisScreen> {
  // Timer countdown (30 menit = 1800 detik)
  int _remainingSeconds = 1800;
  Timer? _timer;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  Future<void> _handlePayment() async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    // Show verification message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Memverifikasi Pembayaran...'),
        backgroundColor: AppColor.activeDot,
        duration: Duration(seconds: 2),
      ),
    );

    // Simulate payment verification (2 seconds)
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Navigate to Success Screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const PaymentSuccessScreen(),
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
          'QRIS',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Instruction Text
                    Text(
                      'Pindai kode QRIS dibawah untuk menyelesaikan pembayaran',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // QR Code - UKURAN SANGAT BESAR
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.qr_code_2,
                        size: 250, // UKURAN SANGAT BESAR
                        color: Colors.black87,
                      ),
                      // Kalau ada asset QR:
                      // child: Image.asset(
                      //   'assets/qris_dummy.png',
                      //   width: 250,
                      //   height: 250,
                      //   fit: BoxFit.contain,
                      // ),
                    ),

                    const SizedBox(height: 40),

                    // Timer Section
                    Text(
                      'Selesaikan pembayaran dalam',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Countdown Timer - UKURAN BESAR & TEBAL
                    Text(
                      _formatTime(_remainingSeconds),
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: AppColor.activeDot,
                        letterSpacing: 3,
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Button
          _buildBottomButton(),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
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
        child: SizedBox(
          width: double.infinity, // FULL WIDTH
          child: ElevatedButton(
            onPressed: _isProcessing ? null : _handlePayment,
            style: ElevatedButton.styleFrom(
              backgroundColor: _isProcessing ? Colors.grey[400] : AppColor.activeDot,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Text(
              _isProcessing ? 'Memproses...' : 'Unduh QRIS',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}