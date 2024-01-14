import 'dart:async';
import 'dart:io';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'features/levels/level.dart';
import 'features/player/jump_button.dart';
import 'features/player/player.dart';

class PixelAdventure extends FlameGame
    with
        HasKeyboardHandlerComponents,
        DragCallbacks,
        HasCollisionDetection,
        TapCallbacks {
  @override
  Color backgroundColor() => const Color(0xFF211F30);

  late CameraComponent cam;
  late final JoystickComponent joystick;

  final player = Player(character: 'Pink Man');

  late bool showControls;
  bool playSounds = kIsWeb || Platform.isAndroid || Platform.isIOS;
  double soundVolume = 0.01;

  List<String> levelNames = [
    'Level-01',
    'Level-02',
    'Level-03',
    'Level-04',
    'Level-05',
  ];

  int currentLevel = 0;

  @override
  FutureOr<void> onLoad() async {
    showControls = (kIsWeb && size[0] < 1000 && size[1] < 500) ||
        (kIsWeb && size[1] < 1000 && size[0] < 500) ||
        !kIsWeb && (Platform.isAndroid || Platform.isIOS);
    await images.loadAllImages();
    _loadLevel();
    if (showControls) drawControlButtons();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (showControls) _updateJoystick();
    super.update(dt);
  }

  void _addJoystick() {
    joystick = JoystickComponent(
      priority: 10,
      knob: SpriteComponent(
        sprite: Sprite(
          images.fromCache('HUD/Knob.png'),
        ),
      ),
      background: SpriteComponent(
        sprite: Sprite(
          images.fromCache('HUD/Joystick.png'),
        ),
      ),
      margin: const EdgeInsets.only(left: 32, bottom: 32),
    );

    add(joystick);
  }

  void _updateJoystick() {
    switch (joystick.direction) {
      case JoystickDirection.left:
      case JoystickDirection.upLeft:
      case JoystickDirection.downLeft:
        player.horizontalMovement = -1;
        break;
      case JoystickDirection.right:
      case JoystickDirection.upRight:
      case JoystickDirection.downRight:
        player.horizontalMovement = 1;
        break;
      default:
        player.horizontalMovement = 0;
        break;
    }
  }

  void drawControlButtons() {
    _addJoystick();
    add(JumpButton());
  }

  void loadNextLevel() {
    removeWhere((component) => component is Level);
    currentLevel++;
    if (currentLevel >= levelNames.length) {
      overlays.add('Game over');
      currentLevel = 0;
    }
    _loadLevel();
  }

  void _loadLevel() {
    Future.delayed(const Duration(seconds: 1), () {
      final world = Level(
        player: player,
        levelName: levelNames[currentLevel],
      );

      cam = CameraComponent.withFixedResolution(
        world: world,
        width: 640,
        height: 360,
      );
      cam.viewfinder.anchor = Anchor.topLeft;
      addAll([cam, world]);
      overlays.add('Score');
      overlays.add('Health');
    });
  }
}
