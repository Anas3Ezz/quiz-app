import 'package:flutter/material.dart';

class LevelsSCreen extends StatelessWidget {
  const LevelsSCreen({super.key});

  final List<LevelModel> levels = const [
    LevelModel(id: "01", color: Color(0xFF916BFF), stars: 3, isLocked: false),
    LevelModel(id: "02", color: Color(0xFF4FA0FF), stars: 3, isLocked: false),
    LevelModel(id: "03", color: Color(0xFFFF7E3A), stars: 2, isLocked: false),
    LevelModel(id: "04", color: Color(0xFF4ED9B4), stars: 1, isLocked: false),
    LevelModel(id: "05", color: Color(0xFFFF47A2), stars: 0, isLocked: true),
    LevelModel(id: "06", color: Color(0xFF322365), stars: 0, isLocked: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B42),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A0B42),
        title: Text('Levels', style: TextStyle(color: Colors.green)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
            childAspectRatio: 0.75,
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(3, (index) {
            bool isFilled = index < level.stars;
            bool isMiddle = index == 1;
            return Padding(
              padding: EdgeInsets.only(
                bottom: isMiddle ? 14.0 : 0.0,
                left: 4,
                right: 4,
              ),
              child: Icon(
                Icons.star,
                size: isMiddle ? 32 : 24,
                color: isFilled ? const Color(0xFFFFC107) : Colors.white24,
              ),
            );
          }),
        ),
        SizedBox(
          height: 130,
          width: 140,
          child: ClipPath(
            clipper: PentagonClipper(),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [level.color, level.color],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -15,
                    left: -15,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.4),
                          width: 8,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: -10,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white.withValues(alpha: 0.4),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Level',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
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
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                            color: level.isLocked
                                ? Colors.white38
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (level.isLocked)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.lock,
                            size: 50,
                            color: Colors.yellow,
                          ),
                        ),
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
