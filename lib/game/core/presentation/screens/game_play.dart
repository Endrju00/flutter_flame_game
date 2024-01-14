import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../../pixel_adventure.dart';
import '../overlays/score_overlay.dart';
import 'game_over.dart';

class GamePlay extends StatelessWidget {
  const GamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: GameWidget(
          game: PixelAdventure(),
          overlayBuilderMap: {
            'Score': (context, game) => const ScoreOverlay(),
            'Game over': (context, game) => GameOverScreen(
                  game: game as PixelAdventure,
                ),
          },
        ),
      ),
    );
  }
}
