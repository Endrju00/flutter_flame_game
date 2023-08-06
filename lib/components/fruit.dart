import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../pixel_adventure.dart';
import 'custom_hitbox.dart';

class Fruit extends SpriteAnimationComponent with HasGameRef<PixelAdventure> {
  final String fruit;

  Fruit({
    this.fruit = 'Apple',
    Vector2? position,
    Vector2? size,
  }) : super(
          position: position,
          size: size,
        );

  bool _isCollected = false;
  final double stepTime = 0.05;
  final hitBox = CustomHitbox(offsetX: 10, offsetY: 10, width: 12, height: 12);

  @override
  FutureOr<void> onLoad() {
    add(
      RectangleHitbox(
        position: Vector2(hitBox.offsetX, hitBox.offsetY),
        size: Vector2(hitBox.width, hitBox.height),
      ),
    );
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('Items/Fruits/$fruit.png'),
      SpriteAnimationData.sequenced(
        amount: 17,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
    return super.onLoad();
  }

  void collect() {
    if (!_isCollected) {
      animation = SpriteAnimation.fromFrameData(
        game.images.fromCache('Items/Fruits/Collected.png'),
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: stepTime,
          textureSize: Vector2.all(32),
          loop: false,
        ),
      );
      _isCollected = true;
      Future.delayed(const Duration(milliseconds: 400), removeFromParent);
    }
  }
}
