import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../pixel_adventure.dart';

class Saw extends SpriteAnimationComponent with HasGameRef<PixelAdventure> {
  final bool isVertical;
  final double offsetNegative;
  final double offsetPositive;

  Saw({
    required this.isVertical,
    required this.offsetNegative,
    required this.offsetPositive,
    Vector2? position,
    Vector2? size,
  }) : super(
          position: position,
          size: size,
        );

  static const stepTime = 0.03;
  static const moveSpeed = 70;

  double moveDirection = 1;
  double rangeNeg = 0;
  double rangePos = 0;

  @override
  FutureOr<void> onLoad() {
    priority = -1;
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('Traps/Saw/On (38x38).png'),
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: stepTime,
        textureSize: Vector2.all(38),
      ),
    ).reversed();

    if (isVertical) {
      rangeNeg = position.y - offsetNegative * size.y;
      rangePos = position.y + offsetPositive * size.y;
    } else {
      rangeNeg = position.x - offsetNegative * size.x;
      rangePos = position.x + offsetPositive * size.x;
    }

    add(CircleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (isVertical) {
      if (position.y >= rangePos) {
        moveDirection = -1;
      } else if (position.y <= rangeNeg) {
        moveDirection = 1;
      }
      position.y += moveDirection * moveSpeed * dt;
    } else {
      if (position.x >= rangePos) {
        moveDirection = -1;
      } else if (position.x <= rangeNeg) {
        moveDirection = 1;
      }
      position.x += moveDirection * moveSpeed * dt;
    }
    super.update(dt);
  }
}
