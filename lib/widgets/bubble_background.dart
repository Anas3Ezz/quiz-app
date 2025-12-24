import 'package:flutter/material.dart';

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
