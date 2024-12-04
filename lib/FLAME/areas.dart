import 'package:commanders/FLAME/commanders.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class PlayArea extends RectangleComponent with HasGameReference<CommandersGame> {
  PlayArea() : super(children: [RectangleHitbox()]);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height - 50);
  }
}

class MenuArea extends RectangleComponent with HasGameReference<CommandersGame> {
  MenuArea() : super(children: []);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, 50);
  }
}
