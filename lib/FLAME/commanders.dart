import 'dart:async';
import 'dart:math';
import 'package:commanders/FLAME/base.dart';
import 'package:commanders/FLAME/bot.dart';
import 'package:commanders/FLAME/areas.dart';
import 'package:commanders/FLAME/hud.dart';
import 'package:commanders/FLAME/rocket.dart';
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
  DateTime lastUpdate = DateTime.now();

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;
    world.addAll([PlayArea(), MenuArea()]);
    //var menu = MenuArea();
    //world.add(menu);
    //menu.add(TextComponent(text: 'Blocks: $freePlayersConstructionBlocks / $freeComputersConstructionBlocks', position: Vector2.all(20), anchor: Anchor.center));
    startGame();
    camera.viewport.add(Hud());
  }

  @override
  void update(double dt) {
    super.update(dt);
    //check win or lose conditions
    //if win
    if (world.children.query<Base>().where((element) => element.status == BaseStatus.mine).length == basesCount) {
      //win
      //show win screen
      world.removeAll(world.children.query<Base>());
      world.removeAll(world.children.query<Bot>());
      world.removeAll(world.children.query<Rocket>());
      world.children.query<PlayArea>().first.game.overlays.add('WinPage');
    }
    int myBases = world.children.query<Base>().where((element) => element.status == BaseStatus.mine).length;
    int enemiesBases = world.children.query<Base>().where((element) => element.status == BaseStatus.enemies).length;
    int pastSecs = DateTime.now().difference(lastUpdate).inSeconds;
    if (pastSecs >= 1) {
      //print('1 second passed');
      freePlayersConstructionBlocks += (myBases / 10);
      freeComputersConstructionBlocks += (enemiesBases / 10);
      lastUpdate = DateTime.now();
    }
    //world.update(dt);
  }
  
  void startGame() {
    world.removeAll(world.children.query<Base>());
    world.removeAll(world.children.query<Bot>());
    world.removeAll(world.children.query<Rocket>());

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