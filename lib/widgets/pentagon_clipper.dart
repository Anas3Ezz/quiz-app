import 'package:flutter/material.dart';

class PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double width = size.width;
    final double height = size.height;
    final double radius = 15.0;

    path.moveTo(width * 0.5 - radius, radius * 0.5);
    path.quadraticBezierTo(width * 0.5, 0, width * 0.5 + radius, radius * 0.5);

    path.lineTo(width - radius, height * 0.3);
    path.quadraticBezierTo(width, height * 0.35, width, height * 0.45);

    path.lineTo(width, height - radius);
    path.quadraticBezierTo(width, height, width - radius, height);

    path.lineTo(radius, height);
    path.quadraticBezierTo(0, height, 0, height - radius);

    path.lineTo(0, height * 0.45);
    path.quadraticBezierTo(0, height * 0.35, radius, height * 0.3);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
