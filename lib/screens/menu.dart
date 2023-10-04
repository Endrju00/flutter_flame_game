import 'package:flutter/material.dart';
import 'package:flutter_flame_game/pixel_adventure.dart';

class Menu extends StatelessWidget {
  final PixelAdventure game;

  const Menu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211F30),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pixel Adventure',
              style: TextStyle(
                fontFamily: 'PixelifySans',
                fontSize: 64,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 64),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => game.overlays.remove('Menu'),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Menu/Buttons/Play.png',
                        height: 32,
                        width: 32,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Play',
                        style: TextStyle(
                          fontFamily: 'PixelifySans',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
