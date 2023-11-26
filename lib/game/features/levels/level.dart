import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

import '../../pixel_adventure.dart';
import '../backgrounds/background_tile.dart';
import '../checkpoints/checkpoint.dart';
import '../enemies/chicken.dart';
import '../collisions/collision_block.dart';
import '../points/fruit.dart';
import '../player/player.dart';
import '../obstacles/saw.dart';

class Level extends World with HasGameRef<PixelAdventure>, CollisionCallbacks {
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

    _scrollingBackground();
    _spawnObjects();
    _addCollisions();

    return super.onLoad();
  }

  void _scrollingBackground() {
    final backgroundLayer = level.tileMap.getLayer<TileLayer>('Background');

    if (backgroundLayer == null) {
      throw Exception('Background layer not found');
    }

    final String? backgroundColor =
        backgroundLayer.properties.getValue('BackgroundColor');

    final tile = BackgroundTile(
      color: backgroundColor,
      position: Vector2.zero(),
    );
    add(tile);
  }

  void _spawnObjects() {
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    if (spawnPointsLayer == null) {
      throw Exception('Spawnpoints layer not found');
    }

    for (final spawnPoint in spawnPointsLayer.objects) {
      switch (spawnPoint.class_) {
        case 'Player':
          player.position = Vector2(spawnPoint.x, spawnPoint.y);
          player.scale.x = 1;
          add(player);
          break;
        case 'Fruit':
          final fruit = Fruit(
            fruit: spawnPoint.name,
            position: Vector2(spawnPoint.x, spawnPoint.y),
          );
          add(fruit);
          break;
        case 'Saw':
          final bool? isVertical = spawnPoint.properties.getValue('isVertical');
          final double? offsetNegative =
              spawnPoint.properties.getValue('offsetNeg');
          final double? offsetPositive =
              spawnPoint.properties.getValue('offsetPos');

          final saw = Saw(
            isVertical: isVertical ?? false,
            offsetNegative: offsetNegative ?? 0,
            offsetPositive: offsetPositive ?? 0,
            position: Vector2(spawnPoint.x, spawnPoint.y),
            size: Vector2(spawnPoint.width, spawnPoint.height),
          );
          add(saw);
          break;
        case 'Checkpoint':
          final checkpoint = Checkpoint(
            position: Vector2(spawnPoint.x, spawnPoint.y),
            size: Vector2(spawnPoint.width, spawnPoint.height),
          );
          add(checkpoint);
          break;
        case 'Chicken':
          final chicken = Chicken(
            position: Vector2(spawnPoint.x, spawnPoint.y),
            size: Vector2(spawnPoint.width, spawnPoint.height),
            offNeg: spawnPoint.properties.getValue('offsetNeg'),
            offPos: spawnPoint.properties.getValue('offsetPos'),
          );
          add(chicken);
          break;
        default:
      }
    }
  }

  void _addCollisions() {
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
  }
}
