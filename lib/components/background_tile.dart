import 'dart:async';

import 'package:flame/components.dart';

import '../pixel_adventure.dart';

class BackgroundTile extends SpriteComponent with HasGameRef<PixelAdventure> {
  final String? color;

  BackgroundTile({
    this.color = 'Green',
    Vector2? position,
  }) : super(
          position: position,
        );

  final double scrollSpeed = 0.8;

  @override
  FutureOr<void> onLoad() {
    priority = -1;
    size = Vector2.all(64);
    sprite = Sprite(game.images.fromCache('Background/$color.png'));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.y += scrollSpeed;
    var scrollHeight = (game.size.y / size.y).floor();

    if (position.y >= size.y * scrollHeight) {
      position.y -= size.y * scrollHeight;
    }

    super.update(dt);
  }
}
