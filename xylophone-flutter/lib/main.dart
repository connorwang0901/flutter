import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1, Colors.red),
              buildKey(2, Colors.orange),
              buildKey(3, Colors.yellow),
              buildKey(4, Colors.green),
              buildKey(5, Colors.cyan),
              buildKey(6, Colors.blue),
              buildKey(7, Colors.purple),
            ],
            ),
        )
        ),
      );
  }

  void playSound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  Widget buildKey(int soundNumber, Color color) {
    return Expanded(
      child: TextButton(
          onPressed: (){
            playSound(soundNumber);
          },
          child: Container(
            color: color,
          )
      ),
    );
  }
}

