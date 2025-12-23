import 'package:flutter/material.dart';
import 'package:quizapp/widgets/onboarding_buttons.dart';
import 'package:quizapp/widgets/wave_painter.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF371E6E),
      body: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: WavePainter())),
          const Positioned.fill(child: BubbleBackground()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  const Icon(Icons.lightbulb, color: Colors.white, size: 140),
                  const SizedBox(height: 20),
                  const Text(
                    'Quizzles',
                    style: TextStyle(
                      fontSize: 55,
                      fontFamily: 'Cursive',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3FE7BD),
                    ),
                  ),
                  const Text(
                    'Let\'s play!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Play Now and level up',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  const Spacer(flex: 3),
                  // Your custom buttons widget
                  const OnBoardingButtons(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BubbleBackground extends StatelessWidget {
  const BubbleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBubble(top: 100, left: 20, size: 60, opacity: 0.08),
        _buildBubble(top: 100, left: 200, size: 80, opacity: 0.08),
        _buildBubble(top: 150, right: 40, size: 30, opacity: 0.1),
        _buildBubble(top: 350, left: 50, size: 50, opacity: 0.05),
        _buildBubble(top: 400, right: -20, size: 100, opacity: 0.07),
      ],
    );
  }

  Widget _buildBubble({
    double? top,
    double? left,
    double? right,
    double? bottom,
    required double size,
    required double opacity,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: 0.02),
        ),
      ),
    );
  }
}
