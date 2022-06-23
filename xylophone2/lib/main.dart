import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Xylophone2());
}

class Xylophone2 extends StatefulWidget {
  const Xylophone2({Key? key}) : super(key: key);

  @override
  State<Xylophone2> createState() => _Xylophone2State();
}

class _Xylophone2State extends State<Xylophone2> {
  playSound(int noteNumber) {
    AudioCache player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Widget buildKey(Color colorKey, int noteInt) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(noteInt);
        },
        child: Container(
          decoration: BoxDecoration(
            color: colorKey,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(Colors.red, 1),
              buildKey(Colors.orange, 2),
              buildKey(Colors.yellow, 3),
              buildKey(Colors.green, 4),
              buildKey(Colors.teal, 5),
              buildKey(Colors.blue, 6),
              buildKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
