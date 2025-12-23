import 'package:flutter/material.dart';

class LevelsSCreen extends StatelessWidget {
  const LevelsSCreen({super.key});

  final List<LevelModel> levels = const [
    LevelModel(id: "01", color: Color(0xFF916BFF), stars: 3, isLocked: false),
    LevelModel(id: "02", color: Color(0xFF4FA0FF), stars: 3, isLocked: false),
    LevelModel(id: "03", color: Color(0xFFFF7E3A), stars: 0, isLocked: false),
    LevelModel(id: "04", color: Color(0xFF4ED9B4), stars: 0, isLocked: false),
    LevelModel(id: "05", color: Color(0xFFFF47A2), stars: 0, isLocked: true),
    LevelModel(id: "06", color: Color(0xFF322365), stars: 0, isLocked: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B42), // Dark Background
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
            childAspectRatio: 0.85,
          ),
          itemCount: levels.length,
          itemBuilder: (context, index) => LevelCard(level: levels[index]),
        ),
      ),
    );
  }
}

class LevelCard extends StatelessWidget {
  final LevelModel level;
  const LevelCard({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            bool isFilled = index < level.stars;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 2, right: 2),
              child: Icon(
                Icons.star,
                size: 24,
                color: isFilled ? const Color(0xFFFFC107) : Colors.white24,
              ),
            );
          }),
        ),
        // Level Shape
        Expanded(
          child: ClipPath(
            clipper: PentagonClipper(),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: level.color),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: CircleAvatar(radius: 20),
                  ),
                  Positioned(
                    top: 10,
                    left: 20,
                    child: CircleAvatar(radius: 10),
                  ),
                  // Text Content
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Level',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: level.isLocked
                                ? Colors.white38
                                : Colors.white,
                          ),
                        ),
                        Text(
                          level.id,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: level.isLocked
                                ? Colors.white38
                                : Colors.white,
                          ),
                        ),
                        Icon(
                          level.isLocked
                              ? Icons.lock
                              : Icons.lock_open_outlined,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Shape Clipper
class PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double r = 15.0; // Roundness radius

    path.moveTo(size.width * 0.5, 0); // Top Center
    path.lineTo(size.width, size.height * 0.3); // Top Right
    path.lineTo(size.width, size.height); // Bottom Right
    path.lineTo(0, size.height); // Bottom Left
    path.lineTo(0, size.height * 0.3); // Top Left
    path.close();

    // To get the smooth rounded corners from your image,
    // we use a simplified version, but for production,
    // you'd use path.quadraticBezierTo for the edges.
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Data Model
class LevelModel {
  final String id;
  final Color color;
  final int stars;
  final bool isLocked;

  const LevelModel({
    required this.id,
    required this.color,
    required this.stars,
    required this.isLocked,
  });
}
