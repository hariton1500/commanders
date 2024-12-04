import 'dart:async';
import 'dart:math';
import 'package:commanders/FLAME/base.dart';
import 'package:commanders/FLAME/bot.dart';
import 'package:commanders/FLAME/areas.dart';
import 'package:commanders/globals.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Route;

class CommandersGame extends FlameGame with HasCollisionDetection, TapDetector {
  CommandersGame() : super(camera: CameraComponent.withFixedResolution(width: gameWidth, height: gameHeight));
  //final double gameWidth, gameHeight;
  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;
    world.add(PlayArea());
    var menu = MenuArea();
    world.add(menu);
    menu.add(TextComponent(text: 'Blocks: $freePlayersConstructionBlocks / $freeComputersConstructionBlocks', position: Vector2.all(20), anchor: Anchor.center));
    startGame();
  }

  void startGame() {
    world.removeAll(world.children.query<Base>());
    world.removeAll(world.children.query<Bot>());
    //world.removeAll(world.children.query<Rocket>());

    for (int i = 0; i < basesCount; i++) {
      double x = Random().nextDouble() * (gameWidth - 100) + 50;
      double y = Random().nextDouble() * (gameHeight - 150) + 50;
      world.add(Base(Vector2(x, y), Colors.grey)..status = BaseStatus.neutral);
    }
    world.add(
      Bot(
        velocity: Vector2.zero(),
        position: Vector2.all(50),
        radius: botRadius,
        status: BotStatus.mine
      )..isCaptureBases = true
      ..isShootEnemies = true
      ..isWeaponInstalled = true
    );
    world.add(
      Bot(
        velocity: Vector2.zero(),
        position: Vector2(gameWidth - 50, gameHeight - 150),
        radius: botRadius,
        status: BotStatus.enemies
      )..isCaptureBases = true
      ..isShootEnemies = true
      ..isWeaponInstalled = true
    );
  }
}