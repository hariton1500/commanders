import 'package:commanders/FLAME/base.dart';
import 'package:commanders/FLAME/bot.dart';
import 'package:commanders/globals.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class BasePage extends ValueRoute<Bot?> {
  BasePage({required this.base, required super.value});
  final Base base;

  @override
  Component build() {
    return PositionComponent(
      children: [
        TextComponent(text: 'Free construction blocks: $freePlayersConstructionBlocks'),
        //ButtonComponent(onPressed: () => complete, children: [TextComponent(text: 'Complete')]),
      ]
    );
  }
}