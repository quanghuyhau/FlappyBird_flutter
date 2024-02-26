import 'package:demo_flappybird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

import '../game/assets.dart';
class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'gameOver';

  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Điểm của bạn : ${game.bird.score}',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            Image.asset(Assets.gameOver),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: Text(
                  "Chơi Lại",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
  void onRestart(){
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
