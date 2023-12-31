import 'package:flutter/material.dart';
import 'package:flutter_flame_game/game/pixel_adventure.dart';

import '../widgets/pixel_button.dart';
import 'menu.dart';

class GameOverScreen extends StatelessWidget {
  final PixelAdventure game;

  const GameOverScreen({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211F30),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Congratulations!',
              style: TextStyle(
                fontFamily: 'PixelifySans',
                fontSize: 64,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'You have completed the game.',
              style: TextStyle(
                fontFamily: 'PixelifySans',
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 32),
            PixelButton(
              text: 'Play again',
              icon: Image.asset(
                'assets/images/Menu/Buttons/Restart.png',
                height: 24,
                width: 24,
                fit: BoxFit.cover,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Menu(),
                  ),
                );
                game.overlays.remove('Game over');
              },
            ),
          ],
        ),
      ),
    );
  }
}
