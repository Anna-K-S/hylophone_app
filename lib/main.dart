import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {

  const XylophoneApp({Key? key}) : super(key: key);

 

  void _playSound(int noteNumber) {
    final player = Audio.load('assets/note$noteNumber.wav');
    player.play();
  }

  Expanded _buildKey({buttonColor, noteNumber, noteName}) {
    return Expanded(
        child: TextButton(
      style: TextButton.styleFrom(backgroundColor: buttonColor),
      onPressed: () {
        _playSound(noteNumber);
      },
      child: Text(
        noteName!,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              XylophoneKey(
                  buttonColor: Colors.red, noteNumber: 1, noteName: 'C'),
              XylophoneKey(
                  buttonColor: Colors.orange, noteNumber: 2, noteName: 'D'),
              XylophoneKey(
                  buttonColor: Colors.yellow, noteNumber: 3, noteName: 'E'),
              XylophoneKey(
                  buttonColor: Colors.green, noteNumber: 4, noteName: 'F'),
              XylophoneKey(
                  buttonColor: Colors.blue, noteNumber: 5, noteName: 'G'),
              XylophoneKey(
                  buttonColor: Colors.indigo, noteNumber: 6, noteName: 'A'),
              XylophoneKey(
                  buttonColor: Colors.purple, noteNumber: 7, noteName: 'B'),
            ],
          ),
        ),
      ),
    );
  }
}

class XylophoneKey extends StatelessWidget {
  final Color buttonColor;
  final int noteNumber;
  final String noteName;

  const XylophoneKey(
      {Key? key,
      required this.buttonColor,
      required this.noteNumber,
      required this.noteName})
      : super(key: key);

  void _playSound() {
    final player = Audio.load('assets/note$noteNumber.wav');
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        onPressed: _playSound,
        child: Text(
          noteName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

