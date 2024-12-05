import 'package:commanders/FLAME/base.dart';

void cleanGlobalVars() {
  freePlayersConstructionBlocks = 1;
  freeComputersConstructionBlocks = 1;
}
double rocketSpeed = 25;
double botSpeed = 15;
double botRadius = 5;
double rocketRadius = 3;
double weaponRange = 150;
num freePlayersConstructionBlocks = 1;
num freeComputersConstructionBlocks = 1;
int basesCount = 10;

double gameWidth = 500;
double gameHeight = 500;

bool isWin = false;

enum BaseStatus {neutral, mine, enemies}
enum BotStatus {neutral, mine, enemies}


late Base pressedBase;
DateTime startGameTime = DateTime.now();