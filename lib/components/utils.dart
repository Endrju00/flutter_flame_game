bool checkCollision(block1, block2) {
  final hitbox = block1.hitbox;
  final block1X = block1.position.x + hitbox.offsetX;
  final block1Y = block1.position.y + hitbox.offsetY;
  final block1Width = hitbox.width;
  final block1Height = hitbox.height;

  final blockX = block2.x;
  final blockY = block2.y;
  final blockWidth = block2.width;
  final blockHeight = block2.height;

  final fixedX = block1.scale.x < 0
      ? block1X - (hitbox.offsetX * 2) - block1Width
      : block1X;
  final fixedY = block2.isPlatform ? block1Y + block1Height : block1Y;

  return (fixedY < blockY + blockHeight &&
      block1Y + block1Height > blockY &&
      fixedX < blockX + blockWidth &&
      fixedX + block1Width > blockX);
}
