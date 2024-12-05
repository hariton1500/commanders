import 'package:commanders/FLAME/commanders.dart';
import 'package:commanders/PAGES/start.dart';
import 'package:commanders/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WinPage extends StatelessWidget {
  const WinPage({super.key, required this.game, required this.isWin});
  final CommandersGame game;
  final bool isWin;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: game.height - 150,
          width: game.width - 100,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You ${isWin ? 'win' : 'lose'}!'),
              //show game time
              Text('Game time: ${DateTime.now().difference(startGameTime).inSeconds} seconds'),
              Text('You have $freePlayersConstructionBlocks blocks left.'),
              //show row with button ok and button exit
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const StartPage()));
                    },
                    child: const Text('Ok'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: const Text('Exit'),
                  ),
                ]
              )
            ]
          )
        )
      )
    );
  }
}