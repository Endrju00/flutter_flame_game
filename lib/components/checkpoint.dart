import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_flame_game/components/player.dart';

import '../pixel_adventure.dart';

class Checkpoint extends SpriteAnimationComponent
    with HasGameRef<PixelAdventure>, CollisionCallbacks {
  Checkpoint({
    Vector2? position,
    Vector2? size,
  }) : super(
          position: position,
          size: size,
        );

  static const stepTime = 0.05;

  bool isReached = false;

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox(
      position: Vector2(18, 56),
      size: Vector2(12, 8),
      collisionType: CollisionType.passive,
    ));
    animation = SpriteAnimation.fromFrameData(
      game.images
          .fromCache('Items/Checkpoints/Checkpoint/Checkpoint (No Flag).png'),
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: stepTime,
        textureSize: Vector2.all(64),
      ),
    );
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player && !isReached) _checkpointReached();
    super.onCollision(intersectionPoints, other);
  }

  void _checkpointReached() {
    const flagOutDuration = Duration(milliseconds: 1300);
    isReached = true;
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache(
          'Items/Checkpoints/Checkpoint/Checkpoint (Flag Out) (64x64).png'),
      SpriteAnimationData.sequenced(
        amount: 26,
        stepTime: stepTime,
        textureSize: Vector2.all(64),
        loop: false,
      ),
    );

    Future.delayed(flagOutDuration, () {
      animation = SpriteAnimation.fromFrameData(
        game.images.fromCache(
            'Items/Checkpoints/Checkpoint/Checkpoint (Flag Idle)(64x64).png'),
        SpriteAnimationData.sequenced(
          amount: 10,
          stepTime: stepTime,
          textureSize: Vector2.all(64),
        ),
      );
    });
  }
}
