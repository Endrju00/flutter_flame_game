import 'collision_block.dart';
import 'player.dart';

bool checkCollision(Player player, CollisionBlock block) {
  final hitbox = player.hitbox;
  final block1X = player.position.x + hitbox.offsetX;
  final block1Y = player.position.y + hitbox.offsetY;
  final block1Width = hitbox.width;
  final block1Height = hitbox.height;

  final blockX = block.x;
  final blockY = block.y;
  final blockWidth = block.width;
  final blockHeight = block.height;

  final fixedX = player.scale.x < 0
      ? block1X - (hitbox.offsetX * 2) - block1Width
      : block1X;
  final fixedY = block.isPlatform ? block1Y + block1Height : block1Y;

  return (fixedY < blockY + blockHeight &&
      block1Y + block1Height > blockY &&
      fixedX < blockX + blockWidth &&
      fixedX + block1Width > blockX);
}
