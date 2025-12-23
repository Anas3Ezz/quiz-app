import 'package:flutter/material.dart';
import 'package:quizapp/screens/levels_screen.dart';
import 'package:quizapp/widgets/pentagon_clipper.dart';

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
