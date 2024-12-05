import 'package:commanders/PAGES/game.dart';
import 'package:commanders/globals.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  //int basesCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('How many bases: $basesCount'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Slider(
                value: basesCount.toDouble(),
                min: 10,
                max: 100,
                label: 'How many bases',
                onChanged: (x) {
                  setState(() {
                    basesCount = x.round();
                  });
                }
              ),
            ),
            Text('Bots speed: $botSpeed'),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Slider(
                value: botSpeed,
                min: 5,
                max: 50,
                divisions: 9,
                label: 'Bots speed',
                onChanged: (x) {
                  setState(() {
                    botSpeed = x;
                  });
                }
              ),
            ),
            Text('Rockets speed: $rocketSpeed'),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Slider(
                value: rocketSpeed,
                min: 15,
                max: 75,
                divisions: 12,
                label: 'Rockets speed',
                onChanged: (x) {
                  setState(() {
                    rocketSpeed = x;
                  });
                }
              ),
            ),
            TextButton(onPressed: () {
              startGameTime = DateTime.now();
              //start game
              //load map
              gameWidth = MediaQuery.of(context).size.width;
              gameHeight = MediaQuery.of(context).size.height;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const GamePage()));
            }, child: const Text('Start game')),
          ],
        ),
      ),
    );
  }
}