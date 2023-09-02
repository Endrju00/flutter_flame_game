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
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) _checkpointReached();
    super.onCollisionStart(intersectionPoints, other);
  }

  void _checkpointReached() async {
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

    await animationTicker?.completed;
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache(
          'Items/Checkpoints/Checkpoint/Checkpoint (Flag Idle)(64x64).png'),
      SpriteAnimationData.sequenced(
        amount: 10,
        stepTime: stepTime,
        textureSize: Vector2.all(64),
      ),
    );
  }
}
