import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(child: XylophonePage()),
      ),
    ),
  );
}

class XylophonePage extends StatefulWidget {
  const XylophonePage({Key? key}) : super(key: key);

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        KeyXylophone(
          colorKey: Colors.red,
          note: 1,
        ),
        KeyXylophone(
          colorKey: Colors.orange,
          note: 2,
        ),
        KeyXylophone(
          colorKey: Colors.yellow,
          note: 3,
        ),
        KeyXylophone(
          colorKey: Colors.green,
          note: 4,
        ),
        KeyXylophone(
          colorKey: Colors.blue,
          note: 5,
        ),
        KeyXylophone(
          colorKey: Colors.purple,
          note: 6,
        ),
        KeyXylophone(
          colorKey: Colors.indigo,
          note: 7,
        ),
      ],
    );
  }
}

class KeyXylophone extends StatefulWidget {
  final Color colorKey;
  final int note;
  const KeyXylophone({Key? key, required this.colorKey, required this.note})
      : super(key: key);

  @override
  State<KeyXylophone> createState() => _KeyXylophoneState();
}

class _KeyXylophoneState extends State<KeyXylophone> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(1.0),
          ),
        ),
        onPressed: () {
          AudioCache player = AudioCache(prefix: 'assets/');
          player.play('note${widget.note}.wav');
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.colorKey,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
