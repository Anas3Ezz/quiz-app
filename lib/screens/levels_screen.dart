import 'package:flutter/material.dart';
import 'package:quizapp/widgets/level_card.dart';

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
        title: Text(
          'Levels',
          style: TextStyle(
            color: Colors.green,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
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
