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
                constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/images/Menu/Buttons/Play.png',
                            height: 24,
                            width: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text(
                        'Play',
                        textAlign: TextAlign.center,
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
