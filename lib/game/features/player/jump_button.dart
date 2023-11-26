import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

import '../../pixel_adventure.dart';

class JumpButton extends SpriteComponent
    with HasGameRef<PixelAdventure>, TapCallbacks {
  final margin = 32;

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('HUD/JumpButton.png'));
    position = Vector2(
      game.size.x - margin - width,
      game.size.y - margin - height,
    );
    priority = 10;
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.player.hasJumped = true;
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.player.hasJumped = false;
    super.onTapUp(event);
  }
}
