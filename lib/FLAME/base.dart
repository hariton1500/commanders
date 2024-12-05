import 'package:commanders/FLAME/commanders.dart';
import 'package:commanders/globals.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart' hide Route;

class Base extends RectangleComponent with TapCallbacks, HasGameReference<CommandersGame> {
  Base(Vector2 position, this.color) : super(position: position, size: Vector2.all(20), anchor: Anchor.center, paint: Paint()..color = color);

  BaseStatus status = BaseStatus.neutral;
  
  Color color;
  //Color get color => status == BaseStatus.neutral ? Colors.grey : status == BaseStatus.mine ? Colors.green : Colors.red;

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
  }

  @override
  Future<void> onTapDown(TapDownEvent event) async {
    super.onTapDown(event);
    if (status == BaseStatus.mine) {
      pressedBase = this;
      game.overlays.add('BasePage');
    }
  }
}