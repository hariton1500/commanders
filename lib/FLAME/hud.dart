import 'package:commanders/FLAME/base.dart';
import 'package:commanders/FLAME/bot.dart';
import 'package:commanders/FLAME/commanders.dart';
import 'package:commanders/globals.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Hud extends PositionComponent with HasGameReference<CommandersGame> {
  Hud({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority = 5,
  });

  late TextComponent _blocks;
  late TextComponent _bases;
  late TextComponent _bots;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    String fbp = freePlayersConstructionBlocks.floor().toString();
    String fcb = freeComputersConstructionBlocks.floor().toString();
    _blocks = TextComponent(
      text: 'Blocks: $fbp / $fcb',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      position: Vector2(150, game.size.y - 25),
      anchor: Anchor.center,
    );
    _bases = TextComponent(
      text: 'Bases: ${game.world.children.query<Base>().where((b) => b.status == BaseStatus.mine).length} / ${game.world.children.query<Base>().where((b) => b.status == BaseStatus.enemies).length}',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      position: Vector2(game.size.x / 2, game.size.y - 25),
      anchor: Anchor.center,
    );
    _bots = TextComponent(
      text: 'Bots: ${game.world.children.query<Bot>().where((b) => b.status == BotStatus.mine).length} / ${game.world.children.query<Bot>().where((b) => b.status == BotStatus.enemies).length}',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      position: Vector2(game.size.x - 150, game.size.y - 25),
      anchor: Anchor.center,
    );
    addAll([_blocks, _bases, _bots]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _blocks.text = 'Blocks: ${freePlayersConstructionBlocks.floor()} / ${freeComputersConstructionBlocks.floor()}';
    _bases.text = 'Bases: ${game.world.children.query<Base>().where((b) => b.status == BaseStatus.mine).length} / ${game.world.children.query<Base>().where((b) => b.status == BaseStatus.enemies).length}';
    _bots.text = 'Bots: ${game.world.children.query<Bot>().where((b) => b.status == BotStatus.mine).length} / ${game.world.children.query<Bot>().where((b) => b.status == BotStatus.enemies).length}';
  }
}