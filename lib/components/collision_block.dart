import 'dart:async';

import 'package:flame/components.dart';

class CollisionBlock extends PositionComponent {
  bool isPlatform;

  CollisionBlock({
    position,
    size,
    this.isPlatform = false,
  }) : super(
          position: position,
          size: size,
        );

  @override
  FutureOr<void> onLoad() {
    // debugMode = true;
    return super.onLoad();
  }
}
