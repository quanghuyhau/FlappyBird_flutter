
import 'dart:ui';

import 'package:demo_flappybird/components/background.dart';
import 'package:demo_flappybird/components/bird.dart';
import 'package:demo_flappybird/components/ground.dart';
import 'package:demo_flappybird/components/pipe_group.dart';
import 'package:demo_flappybird/game/configuration.dart';

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';


class FlappyBirdGame extends FlameGame  with TapDetector, HasCollisionDetection{
  FlappyBirdGame();

  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  TextBoxComponent buildScore(){
    return TextBoxComponent(
      text: 'Điểm của bạn : 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: TextStyle(
          fontSize: 25,fontFamily: "Game"
        )
      )
    );
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }
  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    score.text = "Điểm của bạn: ${bird.score}";
  }


}
