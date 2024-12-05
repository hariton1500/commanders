import 'package:commanders/FLAME/bot.dart';
import 'package:commanders/FLAME/commanders.dart';
import 'package:commanders/globals.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart' hide Route;

class Base extends RectangleComponent with TapCallbacks, HasGameReference<CommandersGame> {
  Base(Vector2 position, this.color) : super(position: position, size: Vector2.all(20), anchor: Anchor.center, paint: Paint()..color = color);

  BaseStatus status = BaseStatus.neutral;
  
  Color color;
  bool isProduceBotsPermanent = false;
  bool isCaptureBases = true, isShootEnemies = true, isWeaponInstalled = true;

  @override
  void update(double dt) {
    super.update(dt);
    if (status == BaseStatus.neutral) {
      paint.color = Colors.grey;
    } else if (status == BaseStatus.mine) {
      paint.color = Colors.green;
    } else if (status == BaseStatus.enemies) {
      paint.color = Colors.red;
    }
    if (isProduceBotsPermanent) {
      produceBot();
    }
  }

  @override
  Future<void> onTapDown(TapDownEvent event) async {
    super.onTapDown(event);
    if (status == BaseStatus.mine) {
      pressedBase = this;
      game.overlays.add('BasePage');
    }
  }
  
  Future<void> produceBot() async {
    if (isProduceBotsPermanent) {
      if (status == BaseStatus.mine) {
        if (freePlayersConstructionBlocks >= getCost()) {
          freePlayersConstructionBlocks--;
          game.world.add(Bot(
            velocity: Vector2.zero(),
            position: position,
            radius: 10,
            status: BotStatus.mine,
          )..isCaptureBases = isCaptureBases
          ..isShootEnemies = isShootEnemies
          ..isWeaponInstalled = isWeaponInstalled);
          await game.lifecycleEventsProcessed;
        }
      }
      else if (status == BaseStatus.enemies) {
        if (freeComputersConstructionBlocks >= 4) {
          freeComputersConstructionBlocks -= 4;
          game.world.add(Bot(
            velocity: Vector2.zero(),
            position: position,
            radius: 10,
            status: BotStatus.enemies,
          )..isCaptureBases = isCaptureBases
          ..isShootEnemies = isShootEnemies
          ..isWeaponInstalled = isWeaponInstalled);
          await game.lifecycleEventsProcessed;
        }
      }
    }
  }
  
  int getCost() {
    int cost = 1;
    cost += isWeaponInstalled ? 1 : 0;
    return cost;
  }
}