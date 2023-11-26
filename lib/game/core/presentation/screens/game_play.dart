import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../../../pixel_adventure.dart';
import 'game_over.dart';

PixelAdventure _pixelAdventureGame = PixelAdventure();

class GamePlay extends StatelessWidget {
  const GamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: GameWidget(
          game: _pixelAdventureGame,
          overlayBuilderMap: {
            'Game over': (context, game) {
              return GameOverScreen(game: game as PixelAdventure);
            },
          },
        ),
      ),
    );
  }
}
