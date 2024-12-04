import 'package:commanders/FLAME/commanders.dart';
import 'package:commanders/globals.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key, required this.game});
  final CommandersGame game;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: widget.game.height - 150,
          width: widget.game.width - 100,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Free blocks: $freePlayersConstructionBlocks'),
              ElevatedButton(
                onPressed: () {
                  widget.game.overlays.remove('BasePage');
                },
                child: const Text('Build this bot')
              )
            ],
          ),
        ),
      ),
    );
  }
}