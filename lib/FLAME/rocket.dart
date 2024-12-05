import 'package:commanders/FLAME/bot.dart';
import 'package:commanders/FLAME/commanders.dart';
import 'package:commanders/globals.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Rocket extends CircleComponent with CollisionCallbacks, HasGameRef<CommandersGame> {
  Rocket({
    required this.targetBot,
    required this.shooterBot,
    required this.velocity,
    required super.position,
    required double radius,
  }) : super(
    radius: radius,
    anchor: Anchor.center,
    paint: Paint()..color = Colors.blue);

  Vector2 velocity;
  Bot targetBot, shooterBot;

  @override
  void update(double dt) {
    super.update(dt);
    velocity = (targetBot.position - position).normalized() * rocketSpeed;
    position += velocity * dt;
    if (position.distanceTo(targetBot.position) <= targetBot.radius + radius) {
      try {
        shooterBot.rocket = null;
        targetBot.removeFromParent();
      } catch (e) {}
      game.world.remove(this);
    }
  }
}