import 'package:commanders/globals.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Base'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Free construction blocks: $freePlayersConstructionBlocks'),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: const Text('Build')),
          ]),
      ),
    );
  }
}