import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

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
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKey(buttonColor: Colors.red, noteNumber: 1, noteName: 'C'),
              _buildKey(
                  buttonColor: Colors.orange, noteNumber: 2, noteName: 'D'),
              _buildKey(
                  buttonColor: Colors.yellow, noteNumber: 3, noteName: 'E'),
              _buildKey(
                  buttonColor: Colors.green, noteNumber: 4, noteName: 'F'),
              _buildKey(buttonColor: Colors.blue, noteNumber: 5, noteName: 'G'),
              _buildKey(
                  buttonColor: Colors.indigo, noteNumber: 6, noteName: 'A'),
              _buildKey(
                  buttonColor: Colors.purple[900],
                  noteNumber: 7,
                  noteName: 'B'),
            ],
          ),
        ),
      ),
    );
  }
}
