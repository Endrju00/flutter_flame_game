import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'pixel_adventure.dart';
import 'screens/menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  runApp(
    GameWidget(
      game: PixelAdventure(),
      overlayBuilderMap: {
        'Menu': (context, game) {
          return Menu(game: game as PixelAdventure);
        },
      },
    ),
  );
}
