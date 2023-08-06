import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

import 'collision_block.dart';
import 'player.dart';

class Level extends World {
  final String levelName;
  final Player player;

  Level({
    required this.levelName,
    required this.player,
  });

  late TiledComponent level;
  List<CollisionBlock> collisionBlocks = [];

  @override
  Future<void> onLoad() async {
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));
    add(level);

  void _scrollingBackground() {
    final backgroundLayer = level.tileMap.getLayer<TileLayer>('Background');
    const tileSize = 64;

    final numTileY = (game.size.y / tileSize).floor();
    final numTileX = (game.size.x / tileSize).floor();

    if (backgroundLayer == null) {
      throw Exception('Background layer not found');
    }

    final String? backgroundColor =
        backgroundLayer.properties.getValue('BackgroundColor');

    for (double y = 0; y < numTileY; y++) {
      for (double x = 0; x < numTileX; x++) {
        final tile = BackgroundTile(
          color: backgroundColor,
          position: Vector2(x * tileSize, y * tileSize - tileSize),
        );
        add(tile);
      }
    }
  }
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    if (spawnPointsLayer == null) {
      throw Exception('Spawnpoints layer not found');
    }

    for (final spawnPoint in spawnPointsLayer.objects) {
      switch (spawnPoint.class_) {
        case 'Player':
          player.position = Vector2(spawnPoint.x, spawnPoint.y);
          add(player);
          break;
        default:
      }
    }

    final collisionsLayer = level.tileMap.getLayer<ObjectGroup>('Collisions');

    if (collisionsLayer == null) {
      throw Exception('Collisions layer not found');
    }

    for (final collision in collisionsLayer.objects) {
      switch (collision.class_) {
        case 'Platform':
          final platform = CollisionBlock(
            position: Vector2(collision.x, collision.y),
            size: Vector2(collision.width, collision.height),
            isPlatform: true,
          );
          collisionBlocks.add(platform);
          add(platform);
          break;
        default:
          final block = CollisionBlock(
            position: Vector2(collision.x, collision.y),
            size: Vector2(collision.width, collision.height),
          );
          collisionBlocks.add(block);
          add(block);
          break;
      }
    }
    player.collisionBlocks = collisionBlocks;
    return super.onLoad();
  }
}
