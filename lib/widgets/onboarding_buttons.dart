import 'package:flutter/material.dart';
import 'package:quizapp/screens/levels_screen.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryPurple = Color(0xFF7B51FF);
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LevelsSCreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryPurple,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            child: const Text(
              'Play Now',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 55,
          child: OutlinedButton(
            style: ButtonStyle(),
            onPressed: () {},
            child: const Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
