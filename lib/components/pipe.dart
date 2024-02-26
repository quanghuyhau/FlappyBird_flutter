import 'dart:io';
import 'dart:math';

import 'package:demo_flappybird/game/configuration.dart';
import 'package:demo_flappybird/game/flappy_bird_game.dart';
import 'package:demo_flappybird/game/pipe_position.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../game/assets.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({
    required this.pipePosition,
    required this.height,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);

    switch (pipePosition){
      case PipePosition.top:
        position.y=0;
        sprite =Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }

    add(RectangleHitbox());
  }
}
